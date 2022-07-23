import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/domain/entites/user_entity.dart';

import 'package:flutter_social_app/futures/domain/usecases/usecase.dart';
import 'package:flutter_social_app/futures/presentation/bloc/credential/credential_event.dart';
import 'package:flutter_social_app/futures/presentation/bloc/credential/credential_state.dart';

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
      : super(CredentialInitState()) {
    on<ForgotPasswordEvent>((event, emit) async {
      try {
        await forgotPasswordUseCase.call(event.email);
      } on SocketException catch (e) {
        emit(CredentialErrorState(e.toString()));
      } catch (e) {
        emit(CredentialErrorState(e.toString()));
        rethrow;
      }
    });
    on<SignInEvent>((event, emit) async {
      emit(CredentialLoadingState());
      try {
        await signInUseCase
            .call(UserEntity(email: event.email, password: event.password));
        emit(CredentialSuccessState());
      } on SocketException catch (e) {
        emit(CredentialErrorState(e.toString()));
      } catch (e) {
        emit(CredentialErrorState(e.toString()));
        rethrow;
      }
    });
    on<GoogleAuthEvent>((event, emit) async {
      emit(CredentialLoadingState());
      try {
        await googleSignInUseCase.call();
        emit(CredentialSuccessState());
      } on SocketException catch (e) {
        emit(CredentialErrorState(e.toString()));
      } catch (e) {
        emit(CredentialErrorState(e.toString()));
        rethrow;
      }
    });
    on<SignUpEvent>((event, emit) async {
      try {
        await signUpUseCase.call(
            UserEntity(email: event.user.email, password: event.user.password));
        await getCreateCurrentUserUseCase.call(event.user);
        emit(CredentialSuccessState());
      } on SocketException catch (e) {
        emit(CredentialErrorState(e.toString()));
      } catch (e) {
        emit(CredentialErrorState(e.toString()));
        rethrow;
      }
    });
  }
}
