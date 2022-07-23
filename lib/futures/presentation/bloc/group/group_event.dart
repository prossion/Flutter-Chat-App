import 'package:equatable/equatable.dart';
import 'package:flutter_social_app/futures/domain/entites/group_entity.dart';

abstract class GroupEvent extends Equatable {
  const GroupEvent();
  @override
  List<Object?> get props => [];
}

class GetGroupsEvent extends GroupEvent {}

class GetCreateGroupEvent extends GroupEvent {
  final GroupEntity groupEntity;

  const GetCreateGroupEvent({required this.groupEntity});
}

class JoinGroupEvent extends GroupEvent {
  final GroupEntity groupEntity;

  const JoinGroupEvent({required this.groupEntity});
}

class UpdateGroupEvent extends GroupEvent {
  final GroupEntity groupEntity;

  const UpdateGroupEvent({required this.groupEntity});
}
