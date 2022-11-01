import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/domain/entites/user_entity.dart';

import 'package:flutter_social_app/futures/domain/usecases/usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

part 'credential_bloc.freezed.dart';

@freezed
class CredentialEvent with _$CredentialEvent {
  const CredentialEvent._();

  const factory CredentialEvent.forgotPassword({required final String email}) =
      _ForgotPasswordEvent;

  const factory CredentialEvent.signInEvent({
    required final String email,
    required final String password,
  }) = _SignInEvent;

  const factory CredentialEvent.googleAuthEvent() = _GoogleAuthEvent;

  const factory CredentialEvent.signUpEvent({required final UserEntity user}) =
      _SignUpEvent;
}

@freezed
class CredentialState with _$CredentialState {
  const CredentialState._();

  const factory CredentialState.initial() = _CredentialInitialState;

  const factory CredentialState.loading() = _CredentialLoadingState;

  const factory CredentialState.success() = _CredentialSuccessState;

  const factory CredentialState.error({required final String error}) =
      _CredentialErrorState;
}

class CredentialBloc extends Bloc<CredentialEvent, CredentialState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;
  final GoogleSignInUseCase googleSignInUseCase;

  CredentialBloc(
      {required this.signUpUseCase,
      required this.signInUseCase,
      required this.forgotPasswordUseCase,
      required this.getCreateCurrentUserUseCase,
      required this.googleSignInUseCase})
      : super(const CredentialState.initial()) {
    on<CredentialEvent>(
      (event, emitter) => event.map<Future<void>>(
        forgotPassword: (event) => _forgotPassword(event, emitter),
        signInEvent: (event) => _signInEvent(event, emitter),
        googleAuthEvent: (event) => _googleAuthEvent(event, emitter),
        signUpEvent: (event) => _signUpEvent(event, emitter),
      ),
      transformer: bloc_concurrency.concurrent(),
    );
  }

  Future<void> _forgotPassword(
      _ForgotPasswordEvent event, Emitter<CredentialState> emitter) async {
    try {
      await forgotPasswordUseCase.call(event.email);
    } on SocketException catch (e) {
      emitter(CredentialState.error(error: e.toString()));
    } catch (e) {
      emitter(CredentialState.error(error: e.toString()));
      rethrow;
    }
  }

  Future<void> _signInEvent(
      _SignInEvent event, Emitter<CredentialState> emitter) async {
    emitter(const CredentialState.loading());
    try {
      await signInUseCase
          .call(UserEntity(email: event.email, password: event.password));
      emitter(const CredentialState.success());
    } on SocketException catch (e) {
      emitter(CredentialState.error(error: e.toString()));
    } catch (e) {
      emitter(CredentialState.error(error: e.toString()));
      rethrow;
    }
  }

  Future<void> _googleAuthEvent(
      _GoogleAuthEvent event, Emitter<CredentialState> emitter) async {
    emitter(const CredentialState.loading());
    try {
      await googleSignInUseCase.call();
      emitter(const CredentialState.success());
    } on SocketException catch (e) {
      emitter(CredentialState.error(error: e.toString()));
    } catch (e) {
      emitter(CredentialState.error(error: e.toString()));
      rethrow;
    }
  }

  Future<void> _signUpEvent(
      _SignUpEvent event, Emitter<CredentialState> emitter) async {
    try {
      await signUpUseCase.call(
          UserEntity(email: event.user.email, password: event.user.password));
      await getCreateCurrentUserUseCase.call(event.user);
      emitter(const CredentialState.success());
    } on SocketException catch (e) {
      emitter(CredentialState.error(error: e.toString()));
    } catch (e) {
      emitter(CredentialState.error(error: e.toString()));
      rethrow;
    }
  }
}
