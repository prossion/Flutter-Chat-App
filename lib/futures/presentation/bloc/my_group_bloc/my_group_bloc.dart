import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/data/model/chat_messages_model.dart';
import 'package:flutter_social_app/futures/domain/usecases/join_chat_message_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/usecase.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_group_bloc.freezed.dart';

@freezed
class MyGroupEvent with _$MyGroupEvent {
  const MyGroupEvent._();

  const factory MyGroupEvent.joinMyGroupEvent({
    required final String groupChatId,
  }) = _JoinMyGroupEvent;

  const factory MyGroupEvent.updateDataFirestoreEvent({
    required final String collectionPath,
    required final String docPath,
    required final Map<String, dynamic> dataNeedUpdate,
  }) = _UpdateDataFirestoreEvent;
}

@freezed
class MyGroupState with _$MyGroupState {
  const MyGroupState._();

  const factory MyGroupState.initial() = _MyGroupInitialState;

  const factory MyGroupState.loading() = _MyGroupLoadingState;

  const factory MyGroupState.loaded({
    required final List<ChatMessagesModel> chatMessages,
  }) = _MyGroupSuccessState;

  const factory MyGroupState.error(
      {@Default('Произошла ошибка') String message}) = _MyGroupErrorState;
}

class MyGroupBloc extends Bloc<MyGroupEvent, MyGroupState> {
  final JoinChatMessageUseCase joinChatMessageUseCase;
  final UpdateDataFirestoreUseCase updateDataFirestoreUseCase;

  MyGroupBloc({
    required this.joinChatMessageUseCase,
    required this.updateDataFirestoreUseCase,
  }) : super(const MyGroupState.initial()) {
    on<MyGroupEvent>(
      (event, emitter) => event.map<Future<void>>(
        joinMyGroupEvent: (event) => _joinMyGroupEvent(event, emitter),
        updateDataFirestoreEvent: (event) =>
            _updateDataFirestoreEvent(event, emitter),
      ),
      transformer: bloc_concurrency.concurrent(),
    );
  }

  Future<void> _joinMyGroupEvent(
      _JoinMyGroupEvent event, Emitter<MyGroupState> emitter) async {
    try {
      await joinChatMessageUseCase.call(event.groupChatId);
    } on SocketException catch (_) {
      emitter(const MyGroupState.error());
    } catch (_) {
      emitter(const MyGroupState.error());
      rethrow;
    }
  }

  Future<void> _updateDataFirestoreEvent(
      _UpdateDataFirestoreEvent event, Emitter<MyGroupState> emitter) async {
    try {
      await updateDataFirestoreUseCase.call(
        event.collectionPath,
        event.docPath,
        event.dataNeedUpdate,
      );
    } on SocketException catch (_) {
      emitter(const MyGroupState.error());
    } catch (_) {
      emitter(const MyGroupState.error());
      rethrow;
    }
  }
}
