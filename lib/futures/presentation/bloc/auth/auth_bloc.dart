import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/domain/usecases/usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

part 'auth_bloc.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.appStarted() = _AppStartedEvent;

  const factory AuthEvent.loggedIn() = _LoggedInEvent;

  const factory AuthEvent.loggedOut() = _LoggedOutEvent;
}

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.initial() = _AuthInitialState;

  const factory AuthState.loading() = _AuthLoadingState;

  const factory AuthState.auth({required final String uid}) = _AuthLoadedState;

  const factory AuthState.unAuth() = _AuthErrorState;
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final SignOutUseCase signOutUseCase;
  final GetCurrentUIDUseCase getCurrentUIDUseCase;

  AuthBloc(
      {required this.isSignInUseCase,
      required this.signOutUseCase,
      required this.getCurrentUIDUseCase})
      : super(const AuthState.initial()) {
    on<AuthEvent>(
      (event, emitter) => event.map<Future<void>>(
        appStarted: (event) => _appStarted(event, emitter),
        loggedIn: (event) => _loggedIn(event, emitter),
        loggedOut: (event) => _loggedOut(event, emitter),
      ),
      transformer: bloc_concurrency.concurrent(),
    );
  }

  Future<void> _appStarted(
      _AppStartedEvent event, Emitter<AuthState> emitter) async {
    try {
      // ignore: unused_local_variable
      bool isSignIn = await isSignInUseCase.call();
      // print(isSignIn);
      if (isSignIn = true) {
        final uid = await getCurrentUIDUseCase.call();
        emitter(AuthState.auth(uid: uid));
      } else {
        emitter(const AuthState.unAuth());
      }
    } catch (_) {
      emitter(const AuthState.unAuth());
      rethrow;
    }
  }

  Future<void> _loggedIn(
      _LoggedInEvent event, Emitter<AuthState> emitter) async {
    try {
      final uid = await getCurrentUIDUseCase.call();
      // print("user Id $uid");
      emitter(AuthState.auth(uid: uid));
    } catch (_) {
      // print("user Id null");
      emitter(const AuthState.unAuth());
      rethrow;
    }
  }

  Future<void> _loggedOut(
      _LoggedOutEvent event, Emitter<AuthState> emitter) async {
    try {
      await signOutUseCase.call();
      emitter(const AuthState.unAuth());
    } catch (_) {
      emitter(const AuthState.unAuth());
      rethrow;
    }
  }
}
