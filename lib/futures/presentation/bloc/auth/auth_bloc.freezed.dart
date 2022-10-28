// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function() loggedIn,
    required TResult Function() loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? appStarted,
    TResult? Function()? loggedIn,
    TResult? Function()? loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function()? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStartedEvent value) appStarted,
    required TResult Function(_LoggedInEvent value) loggedIn,
    required TResult Function(_LoggedOutEvent value) loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppStartedEvent value)? appStarted,
    TResult? Function(_LoggedInEvent value)? loggedIn,
    TResult? Function(_LoggedOutEvent value)? loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStartedEvent value)? appStarted,
    TResult Function(_LoggedInEvent value)? loggedIn,
    TResult Function(_LoggedOutEvent value)? loggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AppStartedEventCopyWith<$Res> {
  factory _$$_AppStartedEventCopyWith(
          _$_AppStartedEvent value, $Res Function(_$_AppStartedEvent) then) =
      __$$_AppStartedEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AppStartedEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_AppStartedEvent>
    implements _$$_AppStartedEventCopyWith<$Res> {
  __$$_AppStartedEventCopyWithImpl(
      _$_AppStartedEvent _value, $Res Function(_$_AppStartedEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AppStartedEvent extends _AppStartedEvent {
  const _$_AppStartedEvent() : super._();

  @override
  String toString() {
    return 'AuthEvent.appStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AppStartedEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function() loggedIn,
    required TResult Function() loggedOut,
  }) {
    return appStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? appStarted,
    TResult? Function()? loggedIn,
    TResult? Function()? loggedOut,
  }) {
    return appStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function()? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (appStarted != null) {
      return appStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStartedEvent value) appStarted,
    required TResult Function(_LoggedInEvent value) loggedIn,
    required TResult Function(_LoggedOutEvent value) loggedOut,
  }) {
    return appStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppStartedEvent value)? appStarted,
    TResult? Function(_LoggedInEvent value)? loggedIn,
    TResult? Function(_LoggedOutEvent value)? loggedOut,
  }) {
    return appStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStartedEvent value)? appStarted,
    TResult Function(_LoggedInEvent value)? loggedIn,
    TResult Function(_LoggedOutEvent value)? loggedOut,
    required TResult orElse(),
  }) {
    if (appStarted != null) {
      return appStarted(this);
    }
    return orElse();
  }
}

abstract class _AppStartedEvent extends AuthEvent {
  const factory _AppStartedEvent() = _$_AppStartedEvent;
  const _AppStartedEvent._() : super._();
}

/// @nodoc
abstract class _$$_LoggedInEventCopyWith<$Res> {
  factory _$$_LoggedInEventCopyWith(
          _$_LoggedInEvent value, $Res Function(_$_LoggedInEvent) then) =
      __$$_LoggedInEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoggedInEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_LoggedInEvent>
    implements _$$_LoggedInEventCopyWith<$Res> {
  __$$_LoggedInEventCopyWithImpl(
      _$_LoggedInEvent _value, $Res Function(_$_LoggedInEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoggedInEvent extends _LoggedInEvent {
  const _$_LoggedInEvent() : super._();

  @override
  String toString() {
    return 'AuthEvent.loggedIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoggedInEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function() loggedIn,
    required TResult Function() loggedOut,
  }) {
    return loggedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? appStarted,
    TResult? Function()? loggedIn,
    TResult? Function()? loggedOut,
  }) {
    return loggedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function()? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStartedEvent value) appStarted,
    required TResult Function(_LoggedInEvent value) loggedIn,
    required TResult Function(_LoggedOutEvent value) loggedOut,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppStartedEvent value)? appStarted,
    TResult? Function(_LoggedInEvent value)? loggedIn,
    TResult? Function(_LoggedOutEvent value)? loggedOut,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStartedEvent value)? appStarted,
    TResult Function(_LoggedInEvent value)? loggedIn,
    TResult Function(_LoggedOutEvent value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class _LoggedInEvent extends AuthEvent {
  const factory _LoggedInEvent() = _$_LoggedInEvent;
  const _LoggedInEvent._() : super._();
}

/// @nodoc
abstract class _$$_LoggedOutEventCopyWith<$Res> {
  factory _$$_LoggedOutEventCopyWith(
          _$_LoggedOutEvent value, $Res Function(_$_LoggedOutEvent) then) =
      __$$_LoggedOutEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoggedOutEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_LoggedOutEvent>
    implements _$$_LoggedOutEventCopyWith<$Res> {
  __$$_LoggedOutEventCopyWithImpl(
      _$_LoggedOutEvent _value, $Res Function(_$_LoggedOutEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoggedOutEvent extends _LoggedOutEvent {
  const _$_LoggedOutEvent() : super._();

  @override
  String toString() {
    return 'AuthEvent.loggedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoggedOutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appStarted,
    required TResult Function() loggedIn,
    required TResult Function() loggedOut,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? appStarted,
    TResult? Function()? loggedIn,
    TResult? Function()? loggedOut,
  }) {
    return loggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appStarted,
    TResult Function()? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStartedEvent value) appStarted,
    required TResult Function(_LoggedInEvent value) loggedIn,
    required TResult Function(_LoggedOutEvent value) loggedOut,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppStartedEvent value)? appStarted,
    TResult? Function(_LoggedInEvent value)? loggedIn,
    TResult? Function(_LoggedOutEvent value)? loggedOut,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStartedEvent value)? appStarted,
    TResult Function(_LoggedInEvent value)? loggedIn,
    TResult Function(_LoggedOutEvent value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class _LoggedOutEvent extends AuthEvent {
  const factory _LoggedOutEvent() = _$_LoggedOutEvent;
  const _LoggedOutEvent._() : super._();
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid) auth,
    required TResult Function() unAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid)? auth,
    TResult? Function()? unAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid)? auth,
    TResult Function()? unAuth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitialState value) initial,
    required TResult Function(_AuthLoadingState value) loading,
    required TResult Function(_AuthLoadedState value) auth,
    required TResult Function(_AuthErrorState value) unAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitialState value)? initial,
    TResult? Function(_AuthLoadingState value)? loading,
    TResult? Function(_AuthLoadedState value)? auth,
    TResult? Function(_AuthErrorState value)? unAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitialState value)? initial,
    TResult Function(_AuthLoadingState value)? loading,
    TResult Function(_AuthLoadedState value)? auth,
    TResult Function(_AuthErrorState value)? unAuth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AuthInitialStateCopyWith<$Res> {
  factory _$$_AuthInitialStateCopyWith(
          _$_AuthInitialState value, $Res Function(_$_AuthInitialState) then) =
      __$$_AuthInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthInitialStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthInitialState>
    implements _$$_AuthInitialStateCopyWith<$Res> {
  __$$_AuthInitialStateCopyWithImpl(
      _$_AuthInitialState _value, $Res Function(_$_AuthInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthInitialState extends _AuthInitialState {
  const _$_AuthInitialState() : super._();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid) auth,
    required TResult Function() unAuth,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid)? auth,
    TResult? Function()? unAuth,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid)? auth,
    TResult Function()? unAuth,
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
    required TResult Function(_AuthInitialState value) initial,
    required TResult Function(_AuthLoadingState value) loading,
    required TResult Function(_AuthLoadedState value) auth,
    required TResult Function(_AuthErrorState value) unAuth,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitialState value)? initial,
    TResult? Function(_AuthLoadingState value)? loading,
    TResult? Function(_AuthLoadedState value)? auth,
    TResult? Function(_AuthErrorState value)? unAuth,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitialState value)? initial,
    TResult Function(_AuthLoadingState value)? loading,
    TResult Function(_AuthLoadedState value)? auth,
    TResult Function(_AuthErrorState value)? unAuth,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AuthInitialState extends AuthState {
  const factory _AuthInitialState() = _$_AuthInitialState;
  const _AuthInitialState._() : super._();
}

/// @nodoc
abstract class _$$_AuthLoadingStateCopyWith<$Res> {
  factory _$$_AuthLoadingStateCopyWith(
          _$_AuthLoadingState value, $Res Function(_$_AuthLoadingState) then) =
      __$$_AuthLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthLoadingStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthLoadingState>
    implements _$$_AuthLoadingStateCopyWith<$Res> {
  __$$_AuthLoadingStateCopyWithImpl(
      _$_AuthLoadingState _value, $Res Function(_$_AuthLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthLoadingState extends _AuthLoadingState {
  const _$_AuthLoadingState() : super._();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid) auth,
    required TResult Function() unAuth,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid)? auth,
    TResult? Function()? unAuth,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid)? auth,
    TResult Function()? unAuth,
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
    required TResult Function(_AuthInitialState value) initial,
    required TResult Function(_AuthLoadingState value) loading,
    required TResult Function(_AuthLoadedState value) auth,
    required TResult Function(_AuthErrorState value) unAuth,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitialState value)? initial,
    TResult? Function(_AuthLoadingState value)? loading,
    TResult? Function(_AuthLoadedState value)? auth,
    TResult? Function(_AuthErrorState value)? unAuth,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitialState value)? initial,
    TResult Function(_AuthLoadingState value)? loading,
    TResult Function(_AuthLoadedState value)? auth,
    TResult Function(_AuthErrorState value)? unAuth,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AuthLoadingState extends AuthState {
  const factory _AuthLoadingState() = _$_AuthLoadingState;
  const _AuthLoadingState._() : super._();
}

/// @nodoc
abstract class _$$_AuthLoadedStateCopyWith<$Res> {
  factory _$$_AuthLoadedStateCopyWith(
          _$_AuthLoadedState value, $Res Function(_$_AuthLoadedState) then) =
      __$$_AuthLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$_AuthLoadedStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthLoadedState>
    implements _$$_AuthLoadedStateCopyWith<$Res> {
  __$$_AuthLoadedStateCopyWithImpl(
      _$_AuthLoadedState _value, $Res Function(_$_AuthLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$_AuthLoadedState(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthLoadedState extends _AuthLoadedState {
  const _$_AuthLoadedState({required this.uid}) : super._();

  @override
  final String uid;

  @override
  String toString() {
    return 'AuthState.auth(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthLoadedState &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthLoadedStateCopyWith<_$_AuthLoadedState> get copyWith =>
      __$$_AuthLoadedStateCopyWithImpl<_$_AuthLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid) auth,
    required TResult Function() unAuth,
  }) {
    return auth(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid)? auth,
    TResult? Function()? unAuth,
  }) {
    return auth?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid)? auth,
    TResult Function()? unAuth,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitialState value) initial,
    required TResult Function(_AuthLoadingState value) loading,
    required TResult Function(_AuthLoadedState value) auth,
    required TResult Function(_AuthErrorState value) unAuth,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitialState value)? initial,
    TResult? Function(_AuthLoadingState value)? loading,
    TResult? Function(_AuthLoadedState value)? auth,
    TResult? Function(_AuthErrorState value)? unAuth,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitialState value)? initial,
    TResult Function(_AuthLoadingState value)? loading,
    TResult Function(_AuthLoadedState value)? auth,
    TResult Function(_AuthErrorState value)? unAuth,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class _AuthLoadedState extends AuthState {
  const factory _AuthLoadedState({required final String uid}) =
      _$_AuthLoadedState;
  const _AuthLoadedState._() : super._();

  String get uid;
  @JsonKey(ignore: true)
  _$$_AuthLoadedStateCopyWith<_$_AuthLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthErrorStateCopyWith<$Res> {
  factory _$$_AuthErrorStateCopyWith(
          _$_AuthErrorState value, $Res Function(_$_AuthErrorState) then) =
      __$$_AuthErrorStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthErrorStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthErrorState>
    implements _$$_AuthErrorStateCopyWith<$Res> {
  __$$_AuthErrorStateCopyWithImpl(
      _$_AuthErrorState _value, $Res Function(_$_AuthErrorState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthErrorState extends _AuthErrorState {
  const _$_AuthErrorState() : super._();

  @override
  String toString() {
    return 'AuthState.unAuth()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String uid) auth,
    required TResult Function() unAuth,
  }) {
    return unAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String uid)? auth,
    TResult? Function()? unAuth,
  }) {
    return unAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String uid)? auth,
    TResult Function()? unAuth,
    required TResult orElse(),
  }) {
    if (unAuth != null) {
      return unAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitialState value) initial,
    required TResult Function(_AuthLoadingState value) loading,
    required TResult Function(_AuthLoadedState value) auth,
    required TResult Function(_AuthErrorState value) unAuth,
  }) {
    return unAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitialState value)? initial,
    TResult? Function(_AuthLoadingState value)? loading,
    TResult? Function(_AuthLoadedState value)? auth,
    TResult? Function(_AuthErrorState value)? unAuth,
  }) {
    return unAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitialState value)? initial,
    TResult Function(_AuthLoadingState value)? loading,
    TResult Function(_AuthLoadedState value)? auth,
    TResult Function(_AuthErrorState value)? unAuth,
    required TResult orElse(),
  }) {
    if (unAuth != null) {
      return unAuth(this);
    }
    return orElse();
  }
}

abstract class _AuthErrorState extends AuthState {
  const factory _AuthErrorState() = _$_AuthErrorState;
  const _AuthErrorState._() : super._();
}
