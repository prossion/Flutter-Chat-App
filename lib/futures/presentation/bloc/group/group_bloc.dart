import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/domain/usecases/usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

part 'group_bloc.freezed.dart';

@freezed
class GroupEvent with _$GroupEvent {
  const GroupEvent._();

  const factory GroupEvent.getGroupsEvent() = _GetGroupsEvent;

  const factory GroupEvent.getCreateEvent({
    required final GroupEntity groupEntity,
  }) = _GetCreateEvent;

  const factory GroupEvent.joinGroupEvent({
    required final GroupEntity groupEntity,
  }) = _JoinGroupEvent;

  const factory GroupEvent.updateGroupEvent({
    required final GroupEntity groupEntity,
  }) = _UpdateGroupEvent;
}

@freezed
class GroupState with _$GroupState {
  const GroupState._();

  const factory GroupState.initial() = _GroupInitialState;

  const factory GroupState.loading() = _GroupLoadingState;

  const factory GroupState.loaded({
    required final List<GroupEntity> groups,
  }) = _GroupSuccessState;

  const factory GroupState.error(
      {@Default('Произошла ошибка') String message}) = _GroupErrorState;
}

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final GetCreateGroupUseCase getCreateGroupUseCase;
  final GetAllGroupsUseCase getAllGroupsUseCase;
  final JoinGroupUseCase joinGroupUseCase;
  final UpdateGroupUseCase groupUseCase;

  GroupBloc(
      {required this.getCreateGroupUseCase,
      required this.getAllGroupsUseCase,
      required this.joinGroupUseCase,
      required this.groupUseCase})
      : super(const GroupState.initial()) {
    on<GroupEvent>(
      (event, emitter) => event.map<Future<void>>(
        getGroupsEvent: (event) => _getGroupsEvent(event, emitter),
        getCreateEvent: (event) => _getCreateEvent(event, emitter),
        joinGroupEvent: (event) => _joinGroupEvent(event, emitter),
        updateGroupEvent: (event) => _updateGroupEvent(event, emitter),
      ),
      transformer: bloc_concurrency.concurrent(),
    );
  }

  Future<void> _getGroupsEvent(
      _GetGroupsEvent event, Emitter<GroupState> emitter) async {
    try {
      emitter(const GroupState.loading());
      final streamResponse = getAllGroupsUseCase.call();
      await for (final groups in streamResponse) {
        emitter(GroupState.loaded(groups: groups));
      }
    } catch (_) {
      emitter(const GroupState.error());
      rethrow;
    }
  }

  Future<void> _getCreateEvent(
      _GetCreateEvent event, Emitter<GroupState> emitter) async {
    try {
      await getCreateGroupUseCase.call(event.groupEntity);
    } on SocketException catch (_) {
      emitter(const GroupState.error());
    } catch (_) {
      emitter(const GroupState.error());
      rethrow;
    }
  }

  Future<void> _joinGroupEvent(
      _JoinGroupEvent event, Emitter<GroupState> emitter) async {
    try {
      await joinGroupUseCase.call(event.groupEntity);
    } on SocketException catch (_) {
      emitter(const GroupState.error());
    } catch (_) {
      emitter(const GroupState.error());
      rethrow;
    }
  }

  Future<void> _updateGroupEvent(
      _UpdateGroupEvent event, Emitter<GroupState> emitter) async {
    try {
      await groupUseCase.call(event.groupEntity);
    } on SocketException catch (_) {
      emitter(const GroupState.error());
    } catch (_) {
      emitter(const GroupState.error());
      rethrow;
    }
  }
}
