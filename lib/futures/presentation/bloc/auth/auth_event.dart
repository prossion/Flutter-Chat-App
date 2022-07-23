import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AppStartedEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoggedInEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoggetOutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
