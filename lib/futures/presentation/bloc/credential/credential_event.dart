import 'package:equatable/equatable.dart';
import 'package:flutter_social_app/futures/domain/entites/user_entity.dart';

abstract class CredentialEvent extends Equatable {
  const CredentialEvent();
}

class ForgotPasswordEvent extends CredentialEvent {
  final String email;

  const ForgotPasswordEvent({required this.email});
  @override
  List<Object?> get props => [email];
}

class SignInEvent extends CredentialEvent {
  final String email;
  final String password;

  const SignInEvent({required this.email, required this.password});
  @override
  List<Object?> get props => [];
}

class GoogleAuthEvent extends CredentialEvent {
  @override
  List<Object?> get props => [];
}

class SignUpEvent extends CredentialEvent {
  final UserEntity user;

  const SignUpEvent({required this.user});
  @override
  List<Object?> get props => [user];
}
