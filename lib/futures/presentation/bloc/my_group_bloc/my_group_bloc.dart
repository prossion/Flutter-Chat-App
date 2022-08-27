import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/domain/usecases/join_chat_message_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/usecase.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';

class MyGroupBloc extends Bloc<MyGroupEvent, MyGroupState> {
  final JoinChatMessageUseCase joinChatMessageUseCase;
  final UpdateDataFirestoreUseCase updateDataFirestoreUseCase;

  MyGroupBloc({
    required this.joinChatMessageUseCase,
    required this.updateDataFirestoreUseCase,
  }) : super(MyGroupInitialState()) {
    on<JoinMyGroupEvent>((event, emit) async {
      try {
        await joinChatMessageUseCase.call(event.groupChatId);
      } on SocketException catch (_) {
        emit(MyGroupErrorState());
      } catch (_) {
        emit(MyGroupErrorState());
        rethrow;
      }
    });
    on<UpdateDataFirestoreEvent>((event, emit) async {
      try {
        await updateDataFirestoreUseCase.call(
          event.collectionPath,
          event.docPath,
          event.dataNeedUpdate,
        );
      } on SocketException catch (_) {
        emit(MyGroupErrorState());
      } catch (_) {
        emit(MyGroupErrorState());
        rethrow;
      }
    });
  }
}
