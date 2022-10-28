// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUsersEvent,
    required TResult Function(UserEntity user) getUpdateUserEvent,
    required TResult Function(String uid) getDeleteUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUsersEvent,
    TResult? Function(UserEntity user)? getUpdateUserEvent,
    TResult? Function(String uid)? getDeleteUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUsersEvent,
    TResult Function(UserEntity user)? getUpdateUserEvent,
    TResult Function(String uid)? getDeleteUserEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUsersEvent value) getUsersEvent,
    required TResult Function(_GetUpdateUserEvent value) getUpdateUserEvent,
    required TResult Function(_GetDeleteUserEvent value) getDeleteUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUsersEvent value)? getUsersEvent,
    TResult? Function(_GetUpdateUserEvent value)? getUpdateUserEvent,
    TResult? Function(_GetDeleteUserEvent value)? getDeleteUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUsersEvent value)? getUsersEvent,
    TResult Function(_GetUpdateUserEvent value)? getUpdateUserEvent,
    TResult Function(_GetDeleteUserEvent value)? getDeleteUserEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetUsersEventCopyWith<$Res> {
  factory _$$_GetUsersEventCopyWith(
          _$_GetUsersEvent value, $Res Function(_$_GetUsersEvent) then) =
      __$$_GetUsersEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetUsersEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_GetUsersEvent>
    implements _$$_GetUsersEventCopyWith<$Res> {
  __$$_GetUsersEventCopyWithImpl(
      _$_GetUsersEvent _value, $Res Function(_$_GetUsersEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetUsersEvent extends _GetUsersEvent {
  const _$_GetUsersEvent() : super._();

  @override
  String toString() {
    return 'UserEvent.getUsersEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetUsersEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUsersEvent,
    required TResult Function(UserEntity user) getUpdateUserEvent,
    required TResult Function(String uid) getDeleteUserEvent,
  }) {
    return getUsersEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUsersEvent,
    TResult? Function(UserEntity user)? getUpdateUserEvent,
    TResult? Function(String uid)? getDeleteUserEvent,
  }) {
    return getUsersEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUsersEvent,
    TResult Function(UserEntity user)? getUpdateUserEvent,
    TResult Function(String uid)? getDeleteUserEvent,
    required TResult orElse(),
  }) {
    if (getUsersEvent != null) {
      return getUsersEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUsersEvent value) getUsersEvent,
    required TResult Function(_GetUpdateUserEvent value) getUpdateUserEvent,
    required TResult Function(_GetDeleteUserEvent value) getDeleteUserEvent,
  }) {
    return getUsersEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUsersEvent value)? getUsersEvent,
    TResult? Function(_GetUpdateUserEvent value)? getUpdateUserEvent,
    TResult? Function(_GetDeleteUserEvent value)? getDeleteUserEvent,
  }) {
    return getUsersEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUsersEvent value)? getUsersEvent,
    TResult Function(_GetUpdateUserEvent value)? getUpdateUserEvent,
    TResult Function(_GetDeleteUserEvent value)? getDeleteUserEvent,
    required TResult orElse(),
  }) {
    if (getUsersEvent != null) {
      return getUsersEvent(this);
    }
    return orElse();
  }
}

abstract class _GetUsersEvent extends UserEvent {
  const factory _GetUsersEvent() = _$_GetUsersEvent;
  const _GetUsersEvent._() : super._();
}

/// @nodoc
abstract class _$$_GetUpdateUserEventCopyWith<$Res> {
  factory _$$_GetUpdateUserEventCopyWith(_$_GetUpdateUserEvent value,
          $Res Function(_$_GetUpdateUserEvent) then) =
      __$$_GetUpdateUserEventCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class __$$_GetUpdateUserEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_GetUpdateUserEvent>
    implements _$$_GetUpdateUserEventCopyWith<$Res> {
  __$$_GetUpdateUserEventCopyWithImpl(
      _$_GetUpdateUserEvent _value, $Res Function(_$_GetUpdateUserEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_GetUpdateUserEvent(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class _$_GetUpdateUserEvent extends _GetUpdateUserEvent {
  const _$_GetUpdateUserEvent({required this.user}) : super._();

  @override
  final UserEntity user;

  @override
  String toString() {
    return 'UserEvent.getUpdateUserEvent(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetUpdateUserEvent &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetUpdateUserEventCopyWith<_$_GetUpdateUserEvent> get copyWith =>
      __$$_GetUpdateUserEventCopyWithImpl<_$_GetUpdateUserEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUsersEvent,
    required TResult Function(UserEntity user) getUpdateUserEvent,
    required TResult Function(String uid) getDeleteUserEvent,
  }) {
    return getUpdateUserEvent(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUsersEvent,
    TResult? Function(UserEntity user)? getUpdateUserEvent,
    TResult? Function(String uid)? getDeleteUserEvent,
  }) {
    return getUpdateUserEvent?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUsersEvent,
    TResult Function(UserEntity user)? getUpdateUserEvent,
    TResult Function(String uid)? getDeleteUserEvent,
    required TResult orElse(),
  }) {
    if (getUpdateUserEvent != null) {
      return getUpdateUserEvent(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUsersEvent value) getUsersEvent,
    required TResult Function(_GetUpdateUserEvent value) getUpdateUserEvent,
    required TResult Function(_GetDeleteUserEvent value) getDeleteUserEvent,
  }) {
    return getUpdateUserEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUsersEvent value)? getUsersEvent,
    TResult? Function(_GetUpdateUserEvent value)? getUpdateUserEvent,
    TResult? Function(_GetDeleteUserEvent value)? getDeleteUserEvent,
  }) {
    return getUpdateUserEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUsersEvent value)? getUsersEvent,
    TResult Function(_GetUpdateUserEvent value)? getUpdateUserEvent,
    TResult Function(_GetDeleteUserEvent value)? getDeleteUserEvent,
    required TResult orElse(),
  }) {
    if (getUpdateUserEvent != null) {
      return getUpdateUserEvent(this);
    }
    return orElse();
  }
}

abstract class _GetUpdateUserEvent extends UserEvent {
  const factory _GetUpdateUserEvent({required final UserEntity user}) =
      _$_GetUpdateUserEvent;
  const _GetUpdateUserEvent._() : super._();

  UserEntity get user;
  @JsonKey(ignore: true)
  _$$_GetUpdateUserEventCopyWith<_$_GetUpdateUserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetDeleteUserEventCopyWith<$Res> {
  factory _$$_GetDeleteUserEventCopyWith(_$_GetDeleteUserEvent value,
          $Res Function(_$_GetDeleteUserEvent) then) =
      __$$_GetDeleteUserEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$_GetDeleteUserEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_GetDeleteUserEvent>
    implements _$$_GetDeleteUserEventCopyWith<$Res> {
  __$$_GetDeleteUserEventCopyWithImpl(
      _$_GetDeleteUserEvent _value, $Res Function(_$_GetDeleteUserEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$_GetDeleteUserEvent(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetDeleteUserEvent extends _GetDeleteUserEvent {
  const _$_GetDeleteUserEvent({required this.uid}) : super._();

  @override
  final String uid;

  @override
  String toString() {
    return 'UserEvent.getDeleteUserEvent(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetDeleteUserEvent &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetDeleteUserEventCopyWith<_$_GetDeleteUserEvent> get copyWith =>
      __$$_GetDeleteUserEventCopyWithImpl<_$_GetDeleteUserEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUsersEvent,
    required TResult Function(UserEntity user) getUpdateUserEvent,
    required TResult Function(String uid) getDeleteUserEvent,
  }) {
    return getDeleteUserEvent(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUsersEvent,
    TResult? Function(UserEntity user)? getUpdateUserEvent,
    TResult? Function(String uid)? getDeleteUserEvent,
  }) {
    return getDeleteUserEvent?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUsersEvent,
    TResult Function(UserEntity user)? getUpdateUserEvent,
    TResult Function(String uid)? getDeleteUserEvent,
    required TResult orElse(),
  }) {
    if (getDeleteUserEvent != null) {
      return getDeleteUserEvent(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUsersEvent value) getUsersEvent,
    required TResult Function(_GetUpdateUserEvent value) getUpdateUserEvent,
    required TResult Function(_GetDeleteUserEvent value) getDeleteUserEvent,
  }) {
    return getDeleteUserEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUsersEvent value)? getUsersEvent,
    TResult? Function(_GetUpdateUserEvent value)? getUpdateUserEvent,
    TResult? Function(_GetDeleteUserEvent value)? getDeleteUserEvent,
  }) {
    return getDeleteUserEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUsersEvent value)? getUsersEvent,
    TResult Function(_GetUpdateUserEvent value)? getUpdateUserEvent,
    TResult Function(_GetDeleteUserEvent value)? getDeleteUserEvent,
    required TResult orElse(),
  }) {
    if (getDeleteUserEvent != null) {
      return getDeleteUserEvent(this);
    }
    return orElse();
  }
}

abstract class _GetDeleteUserEvent extends UserEvent {
  const factory _GetDeleteUserEvent({required final String uid}) =
      _$_GetDeleteUserEvent;
  const _GetDeleteUserEvent._() : super._();

  String get uid;
  @JsonKey(ignore: true)
  _$$_GetDeleteUserEventCopyWith<_$_GetDeleteUserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserEntity> users) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserEntity> users)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserEntity> users)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserInitialState value) initial,
    required TResult Function(_UserLoadingState value) loading,
    required TResult Function(_UserLoadedState value) loaded,
    required TResult Function(_UserErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserInitialState value)? initial,
    TResult? Function(_UserLoadingState value)? loading,
    TResult? Function(_UserLoadedState value)? loaded,
    TResult? Function(_UserErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserInitialState value)? initial,
    TResult Function(_UserLoadingState value)? loading,
    TResult Function(_UserLoadedState value)? loaded,
    TResult Function(_UserErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UserInitialStateCopyWith<$Res> {
  factory _$$_UserInitialStateCopyWith(
          _$_UserInitialState value, $Res Function(_$_UserInitialState) then) =
      __$$_UserInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UserInitialStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_UserInitialState>
    implements _$$_UserInitialStateCopyWith<$Res> {
  __$$_UserInitialStateCopyWithImpl(
      _$_UserInitialState _value, $Res Function(_$_UserInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UserInitialState extends _UserInitialState {
  const _$_UserInitialState() : super._();

  @override
  String toString() {
    return 'UserState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UserInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserEntity> users) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserEntity> users)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserEntity> users)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserInitialState value) initial,
    required TResult Function(_UserLoadingState value) loading,
    required TResult Function(_UserLoadedState value) loaded,
    required TResult Function(_UserErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserInitialState value)? initial,
    TResult? Function(_UserLoadingState value)? loading,
    TResult? Function(_UserLoadedState value)? loaded,
    TResult? Function(_UserErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserInitialState value)? initial,
    TResult Function(_UserLoadingState value)? loading,
    TResult Function(_UserLoadedState value)? loaded,
    TResult Function(_UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _UserInitialState extends UserState {
  const factory _UserInitialState() = _$_UserInitialState;
  const _UserInitialState._() : super._();
}

/// @nodoc
abstract class _$$_UserLoadingStateCopyWith<$Res> {
  factory _$$_UserLoadingStateCopyWith(
          _$_UserLoadingState value, $Res Function(_$_UserLoadingState) then) =
      __$$_UserLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UserLoadingStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_UserLoadingState>
    implements _$$_UserLoadingStateCopyWith<$Res> {
  __$$_UserLoadingStateCopyWithImpl(
      _$_UserLoadingState _value, $Res Function(_$_UserLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UserLoadingState extends _UserLoadingState {
  const _$_UserLoadingState() : super._();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UserLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserEntity> users) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserEntity> users)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserEntity> users)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserInitialState value) initial,
    required TResult Function(_UserLoadingState value) loading,
    required TResult Function(_UserLoadedState value) loaded,
    required TResult Function(_UserErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserInitialState value)? initial,
    TResult? Function(_UserLoadingState value)? loading,
    TResult? Function(_UserLoadedState value)? loaded,
    TResult? Function(_UserErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserInitialState value)? initial,
    TResult Function(_UserLoadingState value)? loading,
    TResult Function(_UserLoadedState value)? loaded,
    TResult Function(_UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _UserLoadingState extends UserState {
  const factory _UserLoadingState() = _$_UserLoadingState;
  const _UserLoadingState._() : super._();
}

/// @nodoc
abstract class _$$_UserLoadedStateCopyWith<$Res> {
  factory _$$_UserLoadedStateCopyWith(
          _$_UserLoadedState value, $Res Function(_$_UserLoadedState) then) =
      __$$_UserLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserEntity> users});
}

/// @nodoc
class __$$_UserLoadedStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_UserLoadedState>
    implements _$$_UserLoadedStateCopyWith<$Res> {
  __$$_UserLoadedStateCopyWithImpl(
      _$_UserLoadedState _value, $Res Function(_$_UserLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_$_UserLoadedState(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>,
    ));
  }
}

/// @nodoc

class _$_UserLoadedState extends _UserLoadedState {
  const _$_UserLoadedState({required final List<UserEntity> users})
      : _users = users,
        super._();

  final List<UserEntity> _users;
  @override
  List<UserEntity> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'UserState.loaded(users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserLoadedState &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserLoadedStateCopyWith<_$_UserLoadedState> get copyWith =>
      __$$_UserLoadedStateCopyWithImpl<_$_UserLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserEntity> users) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(users);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserEntity> users)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserEntity> users)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserInitialState value) initial,
    required TResult Function(_UserLoadingState value) loading,
    required TResult Function(_UserLoadedState value) loaded,
    required TResult Function(_UserErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserInitialState value)? initial,
    TResult? Function(_UserLoadingState value)? loading,
    TResult? Function(_UserLoadedState value)? loaded,
    TResult? Function(_UserErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserInitialState value)? initial,
    TResult Function(_UserLoadingState value)? loading,
    TResult Function(_UserLoadedState value)? loaded,
    TResult Function(_UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _UserLoadedState extends UserState {
  const factory _UserLoadedState({required final List<UserEntity> users}) =
      _$_UserLoadedState;
  const _UserLoadedState._() : super._();

  List<UserEntity> get users;
  @JsonKey(ignore: true)
  _$$_UserLoadedStateCopyWith<_$_UserLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UserErrorStateCopyWith<$Res> {
  factory _$$_UserErrorStateCopyWith(
          _$_UserErrorState value, $Res Function(_$_UserErrorState) then) =
      __$$_UserErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_UserErrorStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_UserErrorState>
    implements _$$_UserErrorStateCopyWith<$Res> {
  __$$_UserErrorStateCopyWithImpl(
      _$_UserErrorState _value, $Res Function(_$_UserErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_UserErrorState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserErrorState extends _UserErrorState {
  const _$_UserErrorState({this.message = 'Произошла ошибка'}) : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'UserState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserErrorStateCopyWith<_$_UserErrorState> get copyWith =>
      __$$_UserErrorStateCopyWithImpl<_$_UserErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserEntity> users) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserEntity> users)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserEntity> users)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserInitialState value) initial,
    required TResult Function(_UserLoadingState value) loading,
    required TResult Function(_UserLoadedState value) loaded,
    required TResult Function(_UserErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserInitialState value)? initial,
    TResult? Function(_UserLoadingState value)? loading,
    TResult? Function(_UserLoadedState value)? loaded,
    TResult? Function(_UserErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserInitialState value)? initial,
    TResult Function(_UserLoadingState value)? loading,
    TResult Function(_UserLoadedState value)? loaded,
    TResult Function(_UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _UserErrorState extends UserState {
  const factory _UserErrorState({final String message}) = _$_UserErrorState;
  const _UserErrorState._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$_UserErrorStateCopyWith<_$_UserErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
