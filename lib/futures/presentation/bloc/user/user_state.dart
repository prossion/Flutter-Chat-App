import 'package:equatable/equatable.dart';
import 'package:flutter_social_app/futures/domain/entites/user_entity.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<UserEntity> users;

  const UserLoadedState({required this.users});
  @override
  List<Object?> get props => [users];
}

class UserSuccessState extends UserState {}

class UserErrorState extends UserState {}
