import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/domain/usecases/delete_user_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/get_all_users_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/get_update_user_usecase.dart';
import 'package:flutter_social_app/futures/presentation/bloc/user/user_event.dart';
import 'package:flutter_social_app/futures/presentation/bloc/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetAllUsersUsecase getAllUsersUsecase;
  final GetUpdateUserUseCase getUpdateUserUseCase;
  final DeleteUserUseCase getDeleteUserUseCase;

  UserBloc(
      {required this.getAllUsersUsecase,
      required this.getUpdateUserUseCase,
      required this.getDeleteUserUseCase})
      : super(UserInitialState()) {
    on<GetUsersEvent>((event, emit) async {
      try {
        emit(UserLoadingState());
        final streamResponse = getAllUsersUsecase.call();
        await for (final users in streamResponse) {
          emit(UserLoadedState(users: users));
        }
      } catch (_) {
        emit(UserErrorState());
        rethrow;
      }
    });
    on<GetUpdateUserEvent>(
      (event, emit) async {
        try {
          await getUpdateUserUseCase.call(event.user);
        } on SocketException catch (_) {
          emit(UserErrorState());
        } catch (_) {
          emit(UserErrorState());
          rethrow;
        }
      },
    );
    on<GetDeleteUserEvent>(
      (event, emit) async {
        try {
          await getDeleteUserUseCase.call(event.uid);
        } on SocketException catch (_) {
          emit(UserErrorState());
        } catch (_) {
          emit(UserErrorState());
          rethrow;
        }
      },
    );
  }
}
