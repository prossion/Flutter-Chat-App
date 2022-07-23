import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/domain/usecases/usecase.dart';
import 'package:flutter_social_app/futures/presentation/bloc/group/group_event.dart';
import 'package:flutter_social_app/futures/presentation/bloc/group/group_state.dart';

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
      : super(GroupInitialState()) {
    on<GetGroupsEvent>((event, emit) async {
      try {
        emit(GroupLoadingState());
        final streamResponse = getAllGroupsUseCase.call();
        await for (final groups in streamResponse) {
          emit(GroupLoadedState(groups: groups));
        }
      } catch (_) {
        emit(GroupFailureState());
        rethrow;
      }
    });
    on<GetCreateGroupEvent>((event, emit) async {
      try {
        await getCreateGroupUseCase.call(event.groupEntity);
      } on SocketException catch (_) {
        emit(GroupFailureState());
      } catch (_) {
        emit(GroupFailureState());
        rethrow;
      }
    });
    on<JoinGroupEvent>((event, emit) async {
      try {
        await joinGroupUseCase.call(event.groupEntity);
      } on SocketException catch (_) {
        emit(GroupFailureState());
      } catch (_) {
        emit(GroupFailureState());
        rethrow;
      }
    });
    on<UpdateGroupEvent>((event, emit) async {
      try {
        await groupUseCase.call(event.groupEntity);
      } on SocketException catch (_) {
        emit(GroupFailureState());
      } catch (_) {
        emit(GroupFailureState());
        rethrow;
      }
    });
  }
}
