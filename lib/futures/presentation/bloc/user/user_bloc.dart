import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/domain/usecases/delete_user_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/get_all_users_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/get_update_user_usecase.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_bloc.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  const UserEvent._();

  const factory UserEvent.getUsersEvent() = _GetUsersEvent;

  const factory UserEvent.getUpdateUserEvent({
    required final UserEntity user,
  }) = _GetUpdateUserEvent;

  const factory UserEvent.getDeleteUserEvent({
    required final String uid,
  }) = _GetDeleteUserEvent;
}

@freezed
class UserState with _$UserState {
  const UserState._();

  const factory UserState.initial() = _UserInitialState;

  const factory UserState.loading() = _UserLoadingState;

  const factory UserState.loaded({
    required final List<UserEntity> users,
  }) = _UserLoadedState;

  const factory UserState.error({@Default('Произошла ошибка') String message}) =
      _UserErrorState;
}

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetAllUsersUsecase getAllUsersUsecase;
  final GetUpdateUserUseCase getUpdateUserUseCase;
  final DeleteUserUseCase getDeleteUserUseCase;

  UserBloc(
      {required this.getAllUsersUsecase,
      required this.getUpdateUserUseCase,
      required this.getDeleteUserUseCase})
      : super(const UserState.initial()) {
    on<UserEvent>(
      (event, emitter) => event.map<Future<void>>(
        getUsersEvent: (event) => _getUsersEvent(event, emitter),
        getUpdateUserEvent: (event) => _getUpdateUserEvent(event, emitter),
        getDeleteUserEvent: (event) => _getDeleteUserEvent(event, emitter),
      ),
      // transformer: bloc_concurrency.droppable(),
    );
  }

  Future<void> _getUsersEvent(
      _GetUsersEvent event, Emitter<UserState> emitter) async {
    try {
      emitter(const UserState.loading());
      final streamResponse = getAllUsersUsecase.call();
      await for (final users in streamResponse) {
        emitter(UserState.loaded(users: users));
      }
    } catch (_) {
      emitter(const UserState.error());
      rethrow;
    }
  }

  Future<void> _getUpdateUserEvent(
      _GetUpdateUserEvent event, Emitter<UserState> emitter) async {
    try {
      await getUpdateUserUseCase.call(event.user);
    } on SocketException catch (_) {
      emitter(const UserState.error());
    } catch (_) {
      emitter(const UserState.error());
      rethrow;
    }
  }

  Future<void> _getDeleteUserEvent(
      _GetDeleteUserEvent event, Emitter<UserState> emitter) async {
    try {
      await getDeleteUserUseCase.call(event.uid);
    } on SocketException catch (_) {
      emitter(const UserState.error());
    } catch (_) {
      emitter(const UserState.error());
      rethrow;
    }
  }
}
