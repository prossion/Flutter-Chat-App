import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthenticatedState extends AuthState {
  final String uid;

  const AuthenticatedState({required this.uid});
  @override
  List<Object?> get props => [];
}

class UnAunthenticatedState extends AuthState {
  @override
  List<Object?> get props => [];
}
