import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/domain/usecases/delete_text_message_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/get_messages_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/send_text_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

part 'chat_bloc.freezed.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const ChatEvent._();

  const factory ChatEvent.getMessages({required final String channelId}) =
      _GetMessagesEvent;

  const factory ChatEvent.sendTextMessage({
    required final TextMessageEntity textMessageEntity,
    required final String channelId,
  }) = _SendTextMessage;

  const factory ChatEvent.deleteTextMessage({
    required final String channelId,
    required final String messageId,
  }) = _DeleteTextMessage;
}

@freezed
class ChatState with _$ChatState {
  const ChatState._();

  const factory ChatState.initial() = _ChatInitialState;

  const factory ChatState.loading() = _ChatLoadingState;

  const factory ChatState.loaded(
      {required final List<TextMessageEntity> messages}) = _ChatLoadedState;

  const factory ChatState.error({@Default('Произошла ошибка') String message}) =
      _ChatErrorState;
}

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendTextMessageUseCase sendTextMessageUseCase;
  final GetMessageUseCase getMessageUseCase;
  final DeleteTextMessageUseCase deleteTextMessageUseCase;

  ChatBloc(
      {required this.sendTextMessageUseCase,
      required this.getMessageUseCase,
      required this.deleteTextMessageUseCase})
      : super(const ChatState.initial()) {
    on<ChatEvent>(
      (event, emitter) => event.map<Future<void>>(
        getMessages: (event) => _getMessages(event, emitter),
        sendTextMessage: (event) => _sendMessages(event, emitter),
        deleteTextMessage: (event) => _deleteMessages(event, emitter),
      ),
      transformer: bloc_concurrency.concurrent(),
    );
  }

  Future<void> _getMessages(
      _GetMessagesEvent event, Emitter<ChatState> emitter) async {
    emitter(const ChatState.loading());
    final streamResponse = getMessageUseCase.call(event.channelId);
    await for (final messages in streamResponse) {
      emitter(ChatState.loaded(messages: messages));
    }
  }

  Future<void> _sendMessages(
      _SendTextMessage event, Emitter<ChatState> emitter) async {
    try {
      await sendTextMessageUseCase.call(
          event.textMessageEntity, event.channelId);
    } on SocketException catch (_) {
      emitter(const ChatState.error());
    } catch (_) {
      emitter(const ChatState.error());
      rethrow;
    }
  }

  Future<void> _deleteMessages(
      _DeleteTextMessage event, Emitter<ChatState> emitter) async {
    try {
      await deleteTextMessageUseCase.call(event.channelId, event.messageId);
    } on SocketException catch (_) {
      emitter(const ChatState.error());
    } catch (_) {
      emitter(const ChatState.error());
      rethrow;
    }
  }
}
