import 'package:equatable/equatable.dart';
import 'package:flutter_social_app/futures/domain/entites/group_entity.dart';

abstract class GroupState extends Equatable {
  const GroupState();
  @override
  List<Object?> get props => [];
}

class GroupInitialState extends GroupState {}

class GroupLoadingState extends GroupState {}

class GroupLoadedState extends GroupState {
  final List<GroupEntity> groups;
  const GroupLoadedState({required this.groups});

  @override
  List<Object?> get props => [groups];
}

class GroupFailureState extends GroupState {}
