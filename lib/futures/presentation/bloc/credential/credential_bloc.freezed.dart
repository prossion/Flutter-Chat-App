// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'credential_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CredentialEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) forgotPassword,
    required TResult Function(String email, String password) signInEvent,
    required TResult Function() googleAuthEvent,
    required TResult Function(UserEntity user) signUpEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String email, String password)? signInEvent,
    TResult? Function()? googleAuthEvent,
    TResult? Function(UserEntity user)? signUpEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? forgotPassword,
    TResult Function(String email, String password)? signInEvent,
    TResult Function()? googleAuthEvent,
    TResult Function(UserEntity user)? signUpEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ForgotPasswordEvent value) forgotPassword,
    required TResult Function(_SignInEvent value) signInEvent,
    required TResult Function(_GoogleAuthEvent value) googleAuthEvent,
    required TResult Function(_SignUpEvent value) signUpEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(_SignInEvent value)? signInEvent,
    TResult? Function(_GoogleAuthEvent value)? googleAuthEvent,
    TResult? Function(_SignUpEvent value)? signUpEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForgotPasswordEvent value)? forgotPassword,
    TResult Function(_SignInEvent value)? signInEvent,
    TResult Function(_GoogleAuthEvent value)? googleAuthEvent,
    TResult Function(_SignUpEvent value)? signUpEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialEventCopyWith<$Res> {
  factory $CredentialEventCopyWith(
          CredentialEvent value, $Res Function(CredentialEvent) then) =
      _$CredentialEventCopyWithImpl<$Res, CredentialEvent>;
}

/// @nodoc
class _$CredentialEventCopyWithImpl<$Res, $Val extends CredentialEvent>
    implements $CredentialEventCopyWith<$Res> {
  _$CredentialEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ForgotPasswordEventCopyWith<$Res> {
  factory _$$_ForgotPasswordEventCopyWith(_$_ForgotPasswordEvent value,
          $Res Function(_$_ForgotPasswordEvent) then) =
      __$$_ForgotPasswordEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_ForgotPasswordEventCopyWithImpl<$Res>
    extends _$CredentialEventCopyWithImpl<$Res, _$_ForgotPasswordEvent>
    implements _$$_ForgotPasswordEventCopyWith<$Res> {
  __$$_ForgotPasswordEventCopyWithImpl(_$_ForgotPasswordEvent _value,
      $Res Function(_$_ForgotPasswordEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_ForgotPasswordEvent(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ForgotPasswordEvent extends _ForgotPasswordEvent {
  const _$_ForgotPasswordEvent({required this.email}) : super._();

  @override
  final String email;

  @override
  String toString() {
    return 'CredentialEvent.forgotPassword(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordEvent &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordEventCopyWith<_$_ForgotPasswordEvent> get copyWith =>
      __$$_ForgotPasswordEventCopyWithImpl<_$_ForgotPasswordEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) forgotPassword,
    required TResult Function(String email, String password) signInEvent,
    required TResult Function() googleAuthEvent,
    required TResult Function(UserEntity user) signUpEvent,
  }) {
    return forgotPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String email, String password)? signInEvent,
    TResult? Function()? googleAuthEvent,
    TResult? Function(UserEntity user)? signUpEvent,
  }) {
    return forgotPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? forgotPassword,
    TResult Function(String email, String password)? signInEvent,
    TResult Function()? googleAuthEvent,
    TResult Function(UserEntity user)? signUpEvent,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ForgotPasswordEvent value) forgotPassword,
    required TResult Function(_SignInEvent value) signInEvent,
    required TResult Function(_GoogleAuthEvent value) googleAuthEvent,
    required TResult Function(_SignUpEvent value) signUpEvent,
  }) {
    return forgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(_SignInEvent value)? signInEvent,
    TResult? Function(_GoogleAuthEvent value)? googleAuthEvent,
    TResult? Function(_SignUpEvent value)? signUpEvent,
  }) {
    return forgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForgotPasswordEvent value)? forgotPassword,
    TResult Function(_SignInEvent value)? signInEvent,
    TResult Function(_GoogleAuthEvent value)? googleAuthEvent,
    TResult Function(_SignUpEvent value)? signUpEvent,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(this);
    }
    return orElse();
  }
}

abstract class _ForgotPasswordEvent extends CredentialEvent {
  const factory _ForgotPasswordEvent({required final String email}) =
      _$_ForgotPasswordEvent;
  const _ForgotPasswordEvent._() : super._();

  String get email;
  @JsonKey(ignore: true)
  _$$_ForgotPasswordEventCopyWith<_$_ForgotPasswordEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignInEventCopyWith<$Res> {
  factory _$$_SignInEventCopyWith(
          _$_SignInEvent value, $Res Function(_$_SignInEvent) then) =
      __$$_SignInEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_SignInEventCopyWithImpl<$Res>
    extends _$CredentialEventCopyWithImpl<$Res, _$_SignInEvent>
    implements _$$_SignInEventCopyWith<$Res> {
  __$$_SignInEventCopyWithImpl(
      _$_SignInEvent _value, $Res Function(_$_SignInEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_SignInEvent(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignInEvent extends _SignInEvent {
  const _$_SignInEvent({required this.email, required this.password})
      : super._();

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'CredentialEvent.signInEvent(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInEvent &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInEventCopyWith<_$_SignInEvent> get copyWith =>
      __$$_SignInEventCopyWithImpl<_$_SignInEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) forgotPassword,
    required TResult Function(String email, String password) signInEvent,
    required TResult Function() googleAuthEvent,
    required TResult Function(UserEntity user) signUpEvent,
  }) {
    return signInEvent(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String email, String password)? signInEvent,
    TResult? Function()? googleAuthEvent,
    TResult? Function(UserEntity user)? signUpEvent,
  }) {
    return signInEvent?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? forgotPassword,
    TResult Function(String email, String password)? signInEvent,
    TResult Function()? googleAuthEvent,
    TResult Function(UserEntity user)? signUpEvent,
    required TResult orElse(),
  }) {
    if (signInEvent != null) {
      return signInEvent(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ForgotPasswordEvent value) forgotPassword,
    required TResult Function(_SignInEvent value) signInEvent,
    required TResult Function(_GoogleAuthEvent value) googleAuthEvent,
    required TResult Function(_SignUpEvent value) signUpEvent,
  }) {
    return signInEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(_SignInEvent value)? signInEvent,
    TResult? Function(_GoogleAuthEvent value)? googleAuthEvent,
    TResult? Function(_SignUpEvent value)? signUpEvent,
  }) {
    return signInEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForgotPasswordEvent value)? forgotPassword,
    TResult Function(_SignInEvent value)? signInEvent,
    TResult Function(_GoogleAuthEvent value)? googleAuthEvent,
    TResult Function(_SignUpEvent value)? signUpEvent,
    required TResult orElse(),
  }) {
    if (signInEvent != null) {
      return signInEvent(this);
    }
    return orElse();
  }
}

abstract class _SignInEvent extends CredentialEvent {
  const factory _SignInEvent(
      {required final String email,
      required final String password}) = _$_SignInEvent;
  const _SignInEvent._() : super._();

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$_SignInEventCopyWith<_$_SignInEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GoogleAuthEventCopyWith<$Res> {
  factory _$$_GoogleAuthEventCopyWith(
          _$_GoogleAuthEvent value, $Res Function(_$_GoogleAuthEvent) then) =
      __$$_GoogleAuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GoogleAuthEventCopyWithImpl<$Res>
    extends _$CredentialEventCopyWithImpl<$Res, _$_GoogleAuthEvent>
    implements _$$_GoogleAuthEventCopyWith<$Res> {
  __$$_GoogleAuthEventCopyWithImpl(
      _$_GoogleAuthEvent _value, $Res Function(_$_GoogleAuthEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GoogleAuthEvent extends _GoogleAuthEvent {
  const _$_GoogleAuthEvent() : super._();

  @override
  String toString() {
    return 'CredentialEvent.googleAuthEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GoogleAuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) forgotPassword,
    required TResult Function(String email, String password) signInEvent,
    required TResult Function() googleAuthEvent,
    required TResult Function(UserEntity user) signUpEvent,
  }) {
    return googleAuthEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String email, String password)? signInEvent,
    TResult? Function()? googleAuthEvent,
    TResult? Function(UserEntity user)? signUpEvent,
  }) {
    return googleAuthEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? forgotPassword,
    TResult Function(String email, String password)? signInEvent,
    TResult Function()? googleAuthEvent,
    TResult Function(UserEntity user)? signUpEvent,
    required TResult orElse(),
  }) {
    if (googleAuthEvent != null) {
      return googleAuthEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ForgotPasswordEvent value) forgotPassword,
    required TResult Function(_SignInEvent value) signInEvent,
    required TResult Function(_GoogleAuthEvent value) googleAuthEvent,
    required TResult Function(_SignUpEvent value) signUpEvent,
  }) {
    return googleAuthEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(_SignInEvent value)? signInEvent,
    TResult? Function(_GoogleAuthEvent value)? googleAuthEvent,
    TResult? Function(_SignUpEvent value)? signUpEvent,
  }) {
    return googleAuthEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForgotPasswordEvent value)? forgotPassword,
    TResult Function(_SignInEvent value)? signInEvent,
    TResult Function(_GoogleAuthEvent value)? googleAuthEvent,
    TResult Function(_SignUpEvent value)? signUpEvent,
    required TResult orElse(),
  }) {
    if (googleAuthEvent != null) {
      return googleAuthEvent(this);
    }
    return orElse();
  }
}

abstract class _GoogleAuthEvent extends CredentialEvent {
  const factory _GoogleAuthEvent() = _$_GoogleAuthEvent;
  const _GoogleAuthEvent._() : super._();
}

/// @nodoc
abstract class _$$_SignUpEventCopyWith<$Res> {
  factory _$$_SignUpEventCopyWith(
          _$_SignUpEvent value, $Res Function(_$_SignUpEvent) then) =
      __$$_SignUpEventCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class __$$_SignUpEventCopyWithImpl<$Res>
    extends _$CredentialEventCopyWithImpl<$Res, _$_SignUpEvent>
    implements _$$_SignUpEventCopyWith<$Res> {
  __$$_SignUpEventCopyWithImpl(
      _$_SignUpEvent _value, $Res Function(_$_SignUpEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_SignUpEvent(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class _$_SignUpEvent extends _SignUpEvent {
  const _$_SignUpEvent({required this.user}) : super._();

  @override
  final UserEntity user;

  @override
  String toString() {
    return 'CredentialEvent.signUpEvent(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpEvent &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpEventCopyWith<_$_SignUpEvent> get copyWith =>
      __$$_SignUpEventCopyWithImpl<_$_SignUpEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) forgotPassword,
    required TResult Function(String email, String password) signInEvent,
    required TResult Function() googleAuthEvent,
    required TResult Function(UserEntity user) signUpEvent,
  }) {
    return signUpEvent(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? forgotPassword,
    TResult? Function(String email, String password)? signInEvent,
    TResult? Function()? googleAuthEvent,
    TResult? Function(UserEntity user)? signUpEvent,
  }) {
    return signUpEvent?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? forgotPassword,
    TResult Function(String email, String password)? signInEvent,
    TResult Function()? googleAuthEvent,
    TResult Function(UserEntity user)? signUpEvent,
    required TResult orElse(),
  }) {
    if (signUpEvent != null) {
      return signUpEvent(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ForgotPasswordEvent value) forgotPassword,
    required TResult Function(_SignInEvent value) signInEvent,
    required TResult Function(_GoogleAuthEvent value) googleAuthEvent,
    required TResult Function(_SignUpEvent value) signUpEvent,
  }) {
    return signUpEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForgotPasswordEvent value)? forgotPassword,
    TResult? Function(_SignInEvent value)? signInEvent,
    TResult? Function(_GoogleAuthEvent value)? googleAuthEvent,
    TResult? Function(_SignUpEvent value)? signUpEvent,
  }) {
    return signUpEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForgotPasswordEvent value)? forgotPassword,
    TResult Function(_SignInEvent value)? signInEvent,
    TResult Function(_GoogleAuthEvent value)? googleAuthEvent,
    TResult Function(_SignUpEvent value)? signUpEvent,
    required TResult orElse(),
  }) {
    if (signUpEvent != null) {
      return signUpEvent(this);
    }
    return orElse();
  }
}

abstract class _SignUpEvent extends CredentialEvent {
  const factory _SignUpEvent({required final UserEntity user}) = _$_SignUpEvent;
  const _SignUpEvent._() : super._();

  UserEntity get user;
  @JsonKey(ignore: true)
  _$$_SignUpEventCopyWith<_$_SignUpEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CredentialState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CredentialInitialState value) initial,
    required TResult Function(_CredentialLoadingState value) loading,
    required TResult Function(_CredentialSuccessState value) success,
    required TResult Function(_CredentialErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CredentialInitialState value)? initial,
    TResult? Function(_CredentialLoadingState value)? loading,
    TResult? Function(_CredentialSuccessState value)? success,
    TResult? Function(_CredentialErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CredentialInitialState value)? initial,
    TResult Function(_CredentialLoadingState value)? loading,
    TResult Function(_CredentialSuccessState value)? success,
    TResult Function(_CredentialErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialStateCopyWith<$Res> {
  factory $CredentialStateCopyWith(
          CredentialState value, $Res Function(CredentialState) then) =
      _$CredentialStateCopyWithImpl<$Res, CredentialState>;
}

/// @nodoc
class _$CredentialStateCopyWithImpl<$Res, $Val extends CredentialState>
    implements $CredentialStateCopyWith<$Res> {
  _$CredentialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CredentialInitialStateCopyWith<$Res> {
  factory _$$_CredentialInitialStateCopyWith(_$_CredentialInitialState value,
          $Res Function(_$_CredentialInitialState) then) =
      __$$_CredentialInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CredentialInitialStateCopyWithImpl<$Res>
    extends _$CredentialStateCopyWithImpl<$Res, _$_CredentialInitialState>
    implements _$$_CredentialInitialStateCopyWith<$Res> {
  __$$_CredentialInitialStateCopyWithImpl(_$_CredentialInitialState _value,
      $Res Function(_$_CredentialInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CredentialInitialState extends _CredentialInitialState {
  const _$_CredentialInitialState() : super._();

  @override
  String toString() {
    return 'CredentialState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CredentialInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
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
    required TResult Function(_CredentialInitialState value) initial,
    required TResult Function(_CredentialLoadingState value) loading,
    required TResult Function(_CredentialSuccessState value) success,
    required TResult Function(_CredentialErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CredentialInitialState value)? initial,
    TResult? Function(_CredentialLoadingState value)? loading,
    TResult? Function(_CredentialSuccessState value)? success,
    TResult? Function(_CredentialErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CredentialInitialState value)? initial,
    TResult Function(_CredentialLoadingState value)? loading,
    TResult Function(_CredentialSuccessState value)? success,
    TResult Function(_CredentialErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _CredentialInitialState extends CredentialState {
  const factory _CredentialInitialState() = _$_CredentialInitialState;
  const _CredentialInitialState._() : super._();
}

/// @nodoc
abstract class _$$_CredentialLoadingStateCopyWith<$Res> {
  factory _$$_CredentialLoadingStateCopyWith(_$_CredentialLoadingState value,
          $Res Function(_$_CredentialLoadingState) then) =
      __$$_CredentialLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CredentialLoadingStateCopyWithImpl<$Res>
    extends _$CredentialStateCopyWithImpl<$Res, _$_CredentialLoadingState>
    implements _$$_CredentialLoadingStateCopyWith<$Res> {
  __$$_CredentialLoadingStateCopyWithImpl(_$_CredentialLoadingState _value,
      $Res Function(_$_CredentialLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CredentialLoadingState extends _CredentialLoadingState {
  const _$_CredentialLoadingState() : super._();

  @override
  String toString() {
    return 'CredentialState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CredentialLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
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
    required TResult Function(_CredentialInitialState value) initial,
    required TResult Function(_CredentialLoadingState value) loading,
    required TResult Function(_CredentialSuccessState value) success,
    required TResult Function(_CredentialErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CredentialInitialState value)? initial,
    TResult? Function(_CredentialLoadingState value)? loading,
    TResult? Function(_CredentialSuccessState value)? success,
    TResult? Function(_CredentialErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CredentialInitialState value)? initial,
    TResult Function(_CredentialLoadingState value)? loading,
    TResult Function(_CredentialSuccessState value)? success,
    TResult Function(_CredentialErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _CredentialLoadingState extends CredentialState {
  const factory _CredentialLoadingState() = _$_CredentialLoadingState;
  const _CredentialLoadingState._() : super._();
}

/// @nodoc
abstract class _$$_CredentialSuccessStateCopyWith<$Res> {
  factory _$$_CredentialSuccessStateCopyWith(_$_CredentialSuccessState value,
          $Res Function(_$_CredentialSuccessState) then) =
      __$$_CredentialSuccessStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CredentialSuccessStateCopyWithImpl<$Res>
    extends _$CredentialStateCopyWithImpl<$Res, _$_CredentialSuccessState>
    implements _$$_CredentialSuccessStateCopyWith<$Res> {
  __$$_CredentialSuccessStateCopyWithImpl(_$_CredentialSuccessState _value,
      $Res Function(_$_CredentialSuccessState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CredentialSuccessState extends _CredentialSuccessState {
  const _$_CredentialSuccessState() : super._();

  @override
  String toString() {
    return 'CredentialState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CredentialSuccessState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CredentialInitialState value) initial,
    required TResult Function(_CredentialLoadingState value) loading,
    required TResult Function(_CredentialSuccessState value) success,
    required TResult Function(_CredentialErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CredentialInitialState value)? initial,
    TResult? Function(_CredentialLoadingState value)? loading,
    TResult? Function(_CredentialSuccessState value)? success,
    TResult? Function(_CredentialErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CredentialInitialState value)? initial,
    TResult Function(_CredentialLoadingState value)? loading,
    TResult Function(_CredentialSuccessState value)? success,
    TResult Function(_CredentialErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _CredentialSuccessState extends CredentialState {
  const factory _CredentialSuccessState() = _$_CredentialSuccessState;
  const _CredentialSuccessState._() : super._();
}

/// @nodoc
abstract class _$$_CredentialErrorStateCopyWith<$Res> {
  factory _$$_CredentialErrorStateCopyWith(_$_CredentialErrorState value,
          $Res Function(_$_CredentialErrorState) then) =
      __$$_CredentialErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_CredentialErrorStateCopyWithImpl<$Res>
    extends _$CredentialStateCopyWithImpl<$Res, _$_CredentialErrorState>
    implements _$$_CredentialErrorStateCopyWith<$Res> {
  __$$_CredentialErrorStateCopyWithImpl(_$_CredentialErrorState _value,
      $Res Function(_$_CredentialErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_CredentialErrorState(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CredentialErrorState extends _CredentialErrorState {
  const _$_CredentialErrorState({required this.error}) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'CredentialState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CredentialErrorState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CredentialErrorStateCopyWith<_$_CredentialErrorState> get copyWith =>
      __$$_CredentialErrorStateCopyWithImpl<_$_CredentialErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CredentialInitialState value) initial,
    required TResult Function(_CredentialLoadingState value) loading,
    required TResult Function(_CredentialSuccessState value) success,
    required TResult Function(_CredentialErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CredentialInitialState value)? initial,
    TResult? Function(_CredentialLoadingState value)? loading,
    TResult? Function(_CredentialSuccessState value)? success,
    TResult? Function(_CredentialErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CredentialInitialState value)? initial,
    TResult Function(_CredentialLoadingState value)? loading,
    TResult Function(_CredentialSuccessState value)? success,
    TResult Function(_CredentialErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _CredentialErrorState extends CredentialState {
  const factory _CredentialErrorState({required final String error}) =
      _$_CredentialErrorState;
  const _CredentialErrorState._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$_CredentialErrorStateCopyWith<_$_CredentialErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
