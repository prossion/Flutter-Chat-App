// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_group_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyGroupEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupChatId) joinMyGroupEvent,
    required TResult Function(String collectionPath, String docPath,
            Map<String, dynamic> dataNeedUpdate)
        updateDataFirestoreEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String groupChatId)? joinMyGroupEvent,
    TResult? Function(String collectionPath, String docPath,
            Map<String, dynamic> dataNeedUpdate)?
        updateDataFirestoreEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupChatId)? joinMyGroupEvent,
    TResult Function(String collectionPath, String docPath,
            Map<String, dynamic> dataNeedUpdate)?
        updateDataFirestoreEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinMyGroupEvent value) joinMyGroupEvent,
    required TResult Function(_UpdateDataFirestoreEvent value)
        updateDataFirestoreEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinMyGroupEvent value)? joinMyGroupEvent,
    TResult? Function(_UpdateDataFirestoreEvent value)?
        updateDataFirestoreEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinMyGroupEvent value)? joinMyGroupEvent,
    TResult Function(_UpdateDataFirestoreEvent value)? updateDataFirestoreEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyGroupEventCopyWith<$Res> {
  factory $MyGroupEventCopyWith(
          MyGroupEvent value, $Res Function(MyGroupEvent) then) =
      _$MyGroupEventCopyWithImpl<$Res, MyGroupEvent>;
}

/// @nodoc
class _$MyGroupEventCopyWithImpl<$Res, $Val extends MyGroupEvent>
    implements $MyGroupEventCopyWith<$Res> {
  _$MyGroupEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_JoinMyGroupEventCopyWith<$Res> {
  factory _$$_JoinMyGroupEventCopyWith(
          _$_JoinMyGroupEvent value, $Res Function(_$_JoinMyGroupEvent) then) =
      __$$_JoinMyGroupEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String groupChatId});
}

/// @nodoc
class __$$_JoinMyGroupEventCopyWithImpl<$Res>
    extends _$MyGroupEventCopyWithImpl<$Res, _$_JoinMyGroupEvent>
    implements _$$_JoinMyGroupEventCopyWith<$Res> {
  __$$_JoinMyGroupEventCopyWithImpl(
      _$_JoinMyGroupEvent _value, $Res Function(_$_JoinMyGroupEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupChatId = null,
  }) {
    return _then(_$_JoinMyGroupEvent(
      groupChatId: null == groupChatId
          ? _value.groupChatId
          : groupChatId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_JoinMyGroupEvent extends _JoinMyGroupEvent {
  const _$_JoinMyGroupEvent({required this.groupChatId}) : super._();

  @override
  final String groupChatId;

  @override
  String toString() {
    return 'MyGroupEvent.joinMyGroupEvent(groupChatId: $groupChatId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JoinMyGroupEvent &&
            (identical(other.groupChatId, groupChatId) ||
                other.groupChatId == groupChatId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupChatId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JoinMyGroupEventCopyWith<_$_JoinMyGroupEvent> get copyWith =>
      __$$_JoinMyGroupEventCopyWithImpl<_$_JoinMyGroupEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupChatId) joinMyGroupEvent,
    required TResult Function(String collectionPath, String docPath,
            Map<String, dynamic> dataNeedUpdate)
        updateDataFirestoreEvent,
  }) {
    return joinMyGroupEvent(groupChatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String groupChatId)? joinMyGroupEvent,
    TResult? Function(String collectionPath, String docPath,
            Map<String, dynamic> dataNeedUpdate)?
        updateDataFirestoreEvent,
  }) {
    return joinMyGroupEvent?.call(groupChatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupChatId)? joinMyGroupEvent,
    TResult Function(String collectionPath, String docPath,
            Map<String, dynamic> dataNeedUpdate)?
        updateDataFirestoreEvent,
    required TResult orElse(),
  }) {
    if (joinMyGroupEvent != null) {
      return joinMyGroupEvent(groupChatId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinMyGroupEvent value) joinMyGroupEvent,
    required TResult Function(_UpdateDataFirestoreEvent value)
        updateDataFirestoreEvent,
  }) {
    return joinMyGroupEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinMyGroupEvent value)? joinMyGroupEvent,
    TResult? Function(_UpdateDataFirestoreEvent value)?
        updateDataFirestoreEvent,
  }) {
    return joinMyGroupEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinMyGroupEvent value)? joinMyGroupEvent,
    TResult Function(_UpdateDataFirestoreEvent value)? updateDataFirestoreEvent,
    required TResult orElse(),
  }) {
    if (joinMyGroupEvent != null) {
      return joinMyGroupEvent(this);
    }
    return orElse();
  }
}

abstract class _JoinMyGroupEvent extends MyGroupEvent {
  const factory _JoinMyGroupEvent({required final String groupChatId}) =
      _$_JoinMyGroupEvent;
  const _JoinMyGroupEvent._() : super._();

  String get groupChatId;
  @JsonKey(ignore: true)
  _$$_JoinMyGroupEventCopyWith<_$_JoinMyGroupEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateDataFirestoreEventCopyWith<$Res> {
  factory _$$_UpdateDataFirestoreEventCopyWith(
          _$_UpdateDataFirestoreEvent value,
          $Res Function(_$_UpdateDataFirestoreEvent) then) =
      __$$_UpdateDataFirestoreEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String collectionPath,
      String docPath,
      Map<String, dynamic> dataNeedUpdate});
}

/// @nodoc
class __$$_UpdateDataFirestoreEventCopyWithImpl<$Res>
    extends _$MyGroupEventCopyWithImpl<$Res, _$_UpdateDataFirestoreEvent>
    implements _$$_UpdateDataFirestoreEventCopyWith<$Res> {
  __$$_UpdateDataFirestoreEventCopyWithImpl(_$_UpdateDataFirestoreEvent _value,
      $Res Function(_$_UpdateDataFirestoreEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionPath = null,
    Object? docPath = null,
    Object? dataNeedUpdate = null,
  }) {
    return _then(_$_UpdateDataFirestoreEvent(
      collectionPath: null == collectionPath
          ? _value.collectionPath
          : collectionPath // ignore: cast_nullable_to_non_nullable
              as String,
      docPath: null == docPath
          ? _value.docPath
          : docPath // ignore: cast_nullable_to_non_nullable
              as String,
      dataNeedUpdate: null == dataNeedUpdate
          ? _value._dataNeedUpdate
          : dataNeedUpdate // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_UpdateDataFirestoreEvent extends _UpdateDataFirestoreEvent {
  const _$_UpdateDataFirestoreEvent(
      {required this.collectionPath,
      required this.docPath,
      required final Map<String, dynamic> dataNeedUpdate})
      : _dataNeedUpdate = dataNeedUpdate,
        super._();

  @override
  final String collectionPath;
  @override
  final String docPath;
  final Map<String, dynamic> _dataNeedUpdate;
  @override
  Map<String, dynamic> get dataNeedUpdate {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dataNeedUpdate);
  }

  @override
  String toString() {
    return 'MyGroupEvent.updateDataFirestoreEvent(collectionPath: $collectionPath, docPath: $docPath, dataNeedUpdate: $dataNeedUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateDataFirestoreEvent &&
            (identical(other.collectionPath, collectionPath) ||
                other.collectionPath == collectionPath) &&
            (identical(other.docPath, docPath) || other.docPath == docPath) &&
            const DeepCollectionEquality()
                .equals(other._dataNeedUpdate, _dataNeedUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collectionPath, docPath,
      const DeepCollectionEquality().hash(_dataNeedUpdate));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateDataFirestoreEventCopyWith<_$_UpdateDataFirestoreEvent>
      get copyWith => __$$_UpdateDataFirestoreEventCopyWithImpl<
          _$_UpdateDataFirestoreEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupChatId) joinMyGroupEvent,
    required TResult Function(String collectionPath, String docPath,
            Map<String, dynamic> dataNeedUpdate)
        updateDataFirestoreEvent,
  }) {
    return updateDataFirestoreEvent(collectionPath, docPath, dataNeedUpdate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String groupChatId)? joinMyGroupEvent,
    TResult? Function(String collectionPath, String docPath,
            Map<String, dynamic> dataNeedUpdate)?
        updateDataFirestoreEvent,
  }) {
    return updateDataFirestoreEvent?.call(
        collectionPath, docPath, dataNeedUpdate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupChatId)? joinMyGroupEvent,
    TResult Function(String collectionPath, String docPath,
            Map<String, dynamic> dataNeedUpdate)?
        updateDataFirestoreEvent,
    required TResult orElse(),
  }) {
    if (updateDataFirestoreEvent != null) {
      return updateDataFirestoreEvent(collectionPath, docPath, dataNeedUpdate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinMyGroupEvent value) joinMyGroupEvent,
    required TResult Function(_UpdateDataFirestoreEvent value)
        updateDataFirestoreEvent,
  }) {
    return updateDataFirestoreEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinMyGroupEvent value)? joinMyGroupEvent,
    TResult? Function(_UpdateDataFirestoreEvent value)?
        updateDataFirestoreEvent,
  }) {
    return updateDataFirestoreEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinMyGroupEvent value)? joinMyGroupEvent,
    TResult Function(_UpdateDataFirestoreEvent value)? updateDataFirestoreEvent,
    required TResult orElse(),
  }) {
    if (updateDataFirestoreEvent != null) {
      return updateDataFirestoreEvent(this);
    }
    return orElse();
  }
}

abstract class _UpdateDataFirestoreEvent extends MyGroupEvent {
  const factory _UpdateDataFirestoreEvent(
          {required final String collectionPath,
          required final String docPath,
          required final Map<String, dynamic> dataNeedUpdate}) =
      _$_UpdateDataFirestoreEvent;
  const _UpdateDataFirestoreEvent._() : super._();

  String get collectionPath;
  String get docPath;
  Map<String, dynamic> get dataNeedUpdate;
  @JsonKey(ignore: true)
  _$$_UpdateDataFirestoreEventCopyWith<_$_UpdateDataFirestoreEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MyGroupState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ChatMessagesModel> chatMessages) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ChatMessagesModel> chatMessages)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ChatMessagesModel> chatMessages)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MyGroupInitialState value) initial,
    required TResult Function(_MyGroupLoadingState value) loading,
    required TResult Function(_MyGroupSuccessState value) loaded,
    required TResult Function(_MyGroupErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MyGroupInitialState value)? initial,
    TResult? Function(_MyGroupLoadingState value)? loading,
    TResult? Function(_MyGroupSuccessState value)? loaded,
    TResult? Function(_MyGroupErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MyGroupInitialState value)? initial,
    TResult Function(_MyGroupLoadingState value)? loading,
    TResult Function(_MyGroupSuccessState value)? loaded,
    TResult Function(_MyGroupErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyGroupStateCopyWith<$Res> {
  factory $MyGroupStateCopyWith(
          MyGroupState value, $Res Function(MyGroupState) then) =
      _$MyGroupStateCopyWithImpl<$Res, MyGroupState>;
}

/// @nodoc
class _$MyGroupStateCopyWithImpl<$Res, $Val extends MyGroupState>
    implements $MyGroupStateCopyWith<$Res> {
  _$MyGroupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_MyGroupInitialStateCopyWith<$Res> {
  factory _$$_MyGroupInitialStateCopyWith(_$_MyGroupInitialState value,
          $Res Function(_$_MyGroupInitialState) then) =
      __$$_MyGroupInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_MyGroupInitialStateCopyWithImpl<$Res>
    extends _$MyGroupStateCopyWithImpl<$Res, _$_MyGroupInitialState>
    implements _$$_MyGroupInitialStateCopyWith<$Res> {
  __$$_MyGroupInitialStateCopyWithImpl(_$_MyGroupInitialState _value,
      $Res Function(_$_MyGroupInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_MyGroupInitialState extends _MyGroupInitialState {
  const _$_MyGroupInitialState() : super._();

  @override
  String toString() {
    return 'MyGroupState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_MyGroupInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ChatMessagesModel> chatMessages) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ChatMessagesModel> chatMessages)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ChatMessagesModel> chatMessages)? loaded,
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
    required TResult Function(_MyGroupInitialState value) initial,
    required TResult Function(_MyGroupLoadingState value) loading,
    required TResult Function(_MyGroupSuccessState value) loaded,
    required TResult Function(_MyGroupErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MyGroupInitialState value)? initial,
    TResult? Function(_MyGroupLoadingState value)? loading,
    TResult? Function(_MyGroupSuccessState value)? loaded,
    TResult? Function(_MyGroupErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MyGroupInitialState value)? initial,
    TResult Function(_MyGroupLoadingState value)? loading,
    TResult Function(_MyGroupSuccessState value)? loaded,
    TResult Function(_MyGroupErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _MyGroupInitialState extends MyGroupState {
  const factory _MyGroupInitialState() = _$_MyGroupInitialState;
  const _MyGroupInitialState._() : super._();
}

/// @nodoc
abstract class _$$_MyGroupLoadingStateCopyWith<$Res> {
  factory _$$_MyGroupLoadingStateCopyWith(_$_MyGroupLoadingState value,
          $Res Function(_$_MyGroupLoadingState) then) =
      __$$_MyGroupLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_MyGroupLoadingStateCopyWithImpl<$Res>
    extends _$MyGroupStateCopyWithImpl<$Res, _$_MyGroupLoadingState>
    implements _$$_MyGroupLoadingStateCopyWith<$Res> {
  __$$_MyGroupLoadingStateCopyWithImpl(_$_MyGroupLoadingState _value,
      $Res Function(_$_MyGroupLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_MyGroupLoadingState extends _MyGroupLoadingState {
  const _$_MyGroupLoadingState() : super._();

  @override
  String toString() {
    return 'MyGroupState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_MyGroupLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ChatMessagesModel> chatMessages) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ChatMessagesModel> chatMessages)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ChatMessagesModel> chatMessages)? loaded,
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
    required TResult Function(_MyGroupInitialState value) initial,
    required TResult Function(_MyGroupLoadingState value) loading,
    required TResult Function(_MyGroupSuccessState value) loaded,
    required TResult Function(_MyGroupErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MyGroupInitialState value)? initial,
    TResult? Function(_MyGroupLoadingState value)? loading,
    TResult? Function(_MyGroupSuccessState value)? loaded,
    TResult? Function(_MyGroupErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MyGroupInitialState value)? initial,
    TResult Function(_MyGroupLoadingState value)? loading,
    TResult Function(_MyGroupSuccessState value)? loaded,
    TResult Function(_MyGroupErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _MyGroupLoadingState extends MyGroupState {
  const factory _MyGroupLoadingState() = _$_MyGroupLoadingState;
  const _MyGroupLoadingState._() : super._();
}

/// @nodoc
abstract class _$$_MyGroupSuccessStateCopyWith<$Res> {
  factory _$$_MyGroupSuccessStateCopyWith(_$_MyGroupSuccessState value,
          $Res Function(_$_MyGroupSuccessState) then) =
      __$$_MyGroupSuccessStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ChatMessagesModel> chatMessages});
}

/// @nodoc
class __$$_MyGroupSuccessStateCopyWithImpl<$Res>
    extends _$MyGroupStateCopyWithImpl<$Res, _$_MyGroupSuccessState>
    implements _$$_MyGroupSuccessStateCopyWith<$Res> {
  __$$_MyGroupSuccessStateCopyWithImpl(_$_MyGroupSuccessState _value,
      $Res Function(_$_MyGroupSuccessState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatMessages = null,
  }) {
    return _then(_$_MyGroupSuccessState(
      chatMessages: null == chatMessages
          ? _value._chatMessages
          : chatMessages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessagesModel>,
    ));
  }
}

/// @nodoc

class _$_MyGroupSuccessState extends _MyGroupSuccessState {
  const _$_MyGroupSuccessState(
      {required final List<ChatMessagesModel> chatMessages})
      : _chatMessages = chatMessages,
        super._();

  final List<ChatMessagesModel> _chatMessages;
  @override
  List<ChatMessagesModel> get chatMessages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatMessages);
  }

  @override
  String toString() {
    return 'MyGroupState.loaded(chatMessages: $chatMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyGroupSuccessState &&
            const DeepCollectionEquality()
                .equals(other._chatMessages, _chatMessages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_chatMessages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyGroupSuccessStateCopyWith<_$_MyGroupSuccessState> get copyWith =>
      __$$_MyGroupSuccessStateCopyWithImpl<_$_MyGroupSuccessState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ChatMessagesModel> chatMessages) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(chatMessages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ChatMessagesModel> chatMessages)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(chatMessages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ChatMessagesModel> chatMessages)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(chatMessages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MyGroupInitialState value) initial,
    required TResult Function(_MyGroupLoadingState value) loading,
    required TResult Function(_MyGroupSuccessState value) loaded,
    required TResult Function(_MyGroupErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MyGroupInitialState value)? initial,
    TResult? Function(_MyGroupLoadingState value)? loading,
    TResult? Function(_MyGroupSuccessState value)? loaded,
    TResult? Function(_MyGroupErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MyGroupInitialState value)? initial,
    TResult Function(_MyGroupLoadingState value)? loading,
    TResult Function(_MyGroupSuccessState value)? loaded,
    TResult Function(_MyGroupErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _MyGroupSuccessState extends MyGroupState {
  const factory _MyGroupSuccessState(
          {required final List<ChatMessagesModel> chatMessages}) =
      _$_MyGroupSuccessState;
  const _MyGroupSuccessState._() : super._();

  List<ChatMessagesModel> get chatMessages;
  @JsonKey(ignore: true)
  _$$_MyGroupSuccessStateCopyWith<_$_MyGroupSuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MyGroupErrorStateCopyWith<$Res> {
  factory _$$_MyGroupErrorStateCopyWith(_$_MyGroupErrorState value,
          $Res Function(_$_MyGroupErrorState) then) =
      __$$_MyGroupErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_MyGroupErrorStateCopyWithImpl<$Res>
    extends _$MyGroupStateCopyWithImpl<$Res, _$_MyGroupErrorState>
    implements _$$_MyGroupErrorStateCopyWith<$Res> {
  __$$_MyGroupErrorStateCopyWithImpl(
      _$_MyGroupErrorState _value, $Res Function(_$_MyGroupErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_MyGroupErrorState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MyGroupErrorState extends _MyGroupErrorState {
  const _$_MyGroupErrorState({this.message = 'Произошла ошибка'}) : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'MyGroupState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyGroupErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyGroupErrorStateCopyWith<_$_MyGroupErrorState> get copyWith =>
      __$$_MyGroupErrorStateCopyWithImpl<_$_MyGroupErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ChatMessagesModel> chatMessages) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ChatMessagesModel> chatMessages)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ChatMessagesModel> chatMessages)? loaded,
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
    required TResult Function(_MyGroupInitialState value) initial,
    required TResult Function(_MyGroupLoadingState value) loading,
    required TResult Function(_MyGroupSuccessState value) loaded,
    required TResult Function(_MyGroupErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MyGroupInitialState value)? initial,
    TResult? Function(_MyGroupLoadingState value)? loading,
    TResult? Function(_MyGroupSuccessState value)? loaded,
    TResult? Function(_MyGroupErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MyGroupInitialState value)? initial,
    TResult Function(_MyGroupLoadingState value)? loading,
    TResult Function(_MyGroupSuccessState value)? loaded,
    TResult Function(_MyGroupErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _MyGroupErrorState extends MyGroupState {
  const factory _MyGroupErrorState({final String message}) =
      _$_MyGroupErrorState;
  const _MyGroupErrorState._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$_MyGroupErrorStateCopyWith<_$_MyGroupErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
