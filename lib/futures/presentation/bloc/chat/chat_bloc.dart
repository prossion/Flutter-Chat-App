import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/domain/usecases/delete_text_message_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/get_messages_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/send_text_message.dart';
import 'package:flutter_social_app/futures/presentation/bloc/chat/chat_event.dart';
import 'package:flutter_social_app/futures/presentation/bloc/chat/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendTextMessageUseCase sendTextMessageUseCase;
  final GetMessageUseCase getMessageUseCase;
  final DeleteTextMessageUseCase deleteTextMessageUseCase;

  ChatBloc(
      {required this.sendTextMessageUseCase,
      required this.getMessageUseCase,
      required this.deleteTextMessageUseCase})
      : super(ChatInitialState()) {
    on<GetMessagesEvent>((event, emit) async {
      emit(ChatLoadingState());
      final streamResponse = getMessageUseCase.call(event.channelId);
      await for (final messages in streamResponse) {
        emit(ChatLoadedState(messages: messages));
      }
    });
    on<SendTextMessageEvent>((event, emit) async {
      try {
        await sendTextMessageUseCase.call(
            event.textMessageEntity, event.channelId);
      } on SocketException catch (_) {
        emit(ChatErrorState());
      } catch (_) {
        emit(ChatErrorState());
        rethrow;
      }
    });
    on<DeleteTextMessage>(((event, emit) async {
      try {
        await deleteTextMessageUseCase.call(event.channelId);
      } on SocketException catch (_) {
        emit(ChatErrorState());
      } catch (_) {
        emit(ChatErrorState());
        rethrow;
      }
    }));
  }
}
