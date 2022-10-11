import 'package:equatable/equatable.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class GetUsersEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class GetUpdateUserEvent extends UserEvent {
  final UserEntity user;

  const GetUpdateUserEvent({required this.user});

  @override
  List<Object?> get props => [user];
}

class GetDeleteUserEvent extends UserEvent {
  final String uid;

  const GetDeleteUserEvent({required this.uid});

  @override
  List<Object?> get props => [uid];
}
