import 'package:equatable/equatable.dart';

abstract class CredentialState extends Equatable {
  const CredentialState();
}

class CredentialInitState extends CredentialState {
  @override
  List<Object?> get props => [];
}

class CredentialLoadingState extends CredentialState {
  @override
  List<Object?> get props => [];
}

class CredentialSuccessState extends CredentialState {
  @override
  List<Object?> get props => [];
}

class CredentialErrorState extends CredentialState {
  final String error;

  const CredentialErrorState(this.error);
  @override
  List<Object?> get props => [];
}
