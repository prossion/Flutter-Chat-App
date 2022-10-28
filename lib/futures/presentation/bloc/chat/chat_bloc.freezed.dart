// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatEvent {
  String get channelId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String channelId) getMessages,
    required TResult Function(
            TextMessageEntity textMessageEntity, String channelId)
        sendTextMessage,
    required TResult Function(String channelId, String messageId)
        deleteTextMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String channelId)? getMessages,
    TResult? Function(TextMessageEntity textMessageEntity, String channelId)?
        sendTextMessage,
    TResult? Function(String channelId, String messageId)? deleteTextMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String channelId)? getMessages,
    TResult Function(TextMessageEntity textMessageEntity, String channelId)?
        sendTextMessage,
    TResult Function(String channelId, String messageId)? deleteTextMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMessagesEvent value) getMessages,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_DeleteTextMessage value) deleteTextMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMessagesEvent value)? getMessages,
    TResult? Function(_SendTextMessage value)? sendTextMessage,
    TResult? Function(_DeleteTextMessage value)? deleteTextMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMessagesEvent value)? getMessages,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_DeleteTextMessage value)? deleteTextMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatEventCopyWith<ChatEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
  @useResult
  $Res call({String channelId});
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
  }) {
    return _then(_value.copyWith(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetMessagesEventCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$$_GetMessagesEventCopyWith(
          _$_GetMessagesEvent value, $Res Function(_$_GetMessagesEvent) then) =
      __$$_GetMessagesEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String channelId});
}

/// @nodoc
class __$$_GetMessagesEventCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_GetMessagesEvent>
    implements _$$_GetMessagesEventCopyWith<$Res> {
  __$$_GetMessagesEventCopyWithImpl(
      _$_GetMessagesEvent _value, $Res Function(_$_GetMessagesEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
  }) {
    return _then(_$_GetMessagesEvent(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetMessagesEvent extends _GetMessagesEvent {
  const _$_GetMessagesEvent({required this.channelId}) : super._();

  @override
  final String channelId;

  @override
  String toString() {
    return 'ChatEvent.getMessages(channelId: $channelId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetMessagesEvent &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetMessagesEventCopyWith<_$_GetMessagesEvent> get copyWith =>
      __$$_GetMessagesEventCopyWithImpl<_$_GetMessagesEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String channelId) getMessages,
    required TResult Function(
            TextMessageEntity textMessageEntity, String channelId)
        sendTextMessage,
    required TResult Function(String channelId, String messageId)
        deleteTextMessage,
  }) {
    return getMessages(channelId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String channelId)? getMessages,
    TResult? Function(TextMessageEntity textMessageEntity, String channelId)?
        sendTextMessage,
    TResult? Function(String channelId, String messageId)? deleteTextMessage,
  }) {
    return getMessages?.call(channelId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String channelId)? getMessages,
    TResult Function(TextMessageEntity textMessageEntity, String channelId)?
        sendTextMessage,
    TResult Function(String channelId, String messageId)? deleteTextMessage,
    required TResult orElse(),
  }) {
    if (getMessages != null) {
      return getMessages(channelId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMessagesEvent value) getMessages,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_DeleteTextMessage value) deleteTextMessage,
  }) {
    return getMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMessagesEvent value)? getMessages,
    TResult? Function(_SendTextMessage value)? sendTextMessage,
    TResult? Function(_DeleteTextMessage value)? deleteTextMessage,
  }) {
    return getMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMessagesEvent value)? getMessages,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_DeleteTextMessage value)? deleteTextMessage,
    required TResult orElse(),
  }) {
    if (getMessages != null) {
      return getMessages(this);
    }
    return orElse();
  }
}

abstract class _GetMessagesEvent extends ChatEvent {
  const factory _GetMessagesEvent({required final String channelId}) =
      _$_GetMessagesEvent;
  const _GetMessagesEvent._() : super._();

  @override
  String get channelId;
  @override
  @JsonKey(ignore: true)
  _$$_GetMessagesEventCopyWith<_$_GetMessagesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendTextMessageCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$$_SendTextMessageCopyWith(
          _$_SendTextMessage value, $Res Function(_$_SendTextMessage) then) =
      __$$_SendTextMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TextMessageEntity textMessageEntity, String channelId});
}

/// @nodoc
class __$$_SendTextMessageCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_SendTextMessage>
    implements _$$_SendTextMessageCopyWith<$Res> {
  __$$_SendTextMessageCopyWithImpl(
      _$_SendTextMessage _value, $Res Function(_$_SendTextMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textMessageEntity = null,
    Object? channelId = null,
  }) {
    return _then(_$_SendTextMessage(
      textMessageEntity: null == textMessageEntity
          ? _value.textMessageEntity
          : textMessageEntity // ignore: cast_nullable_to_non_nullable
              as TextMessageEntity,
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SendTextMessage extends _SendTextMessage {
  const _$_SendTextMessage(
      {required this.textMessageEntity, required this.channelId})
      : super._();

  @override
  final TextMessageEntity textMessageEntity;
  @override
  final String channelId;

  @override
  String toString() {
    return 'ChatEvent.sendTextMessage(textMessageEntity: $textMessageEntity, channelId: $channelId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendTextMessage &&
            (identical(other.textMessageEntity, textMessageEntity) ||
                other.textMessageEntity == textMessageEntity) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textMessageEntity, channelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendTextMessageCopyWith<_$_SendTextMessage> get copyWith =>
      __$$_SendTextMessageCopyWithImpl<_$_SendTextMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String channelId) getMessages,
    required TResult Function(
            TextMessageEntity textMessageEntity, String channelId)
        sendTextMessage,
    required TResult Function(String channelId, String messageId)
        deleteTextMessage,
  }) {
    return sendTextMessage(textMessageEntity, channelId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String channelId)? getMessages,
    TResult? Function(TextMessageEntity textMessageEntity, String channelId)?
        sendTextMessage,
    TResult? Function(String channelId, String messageId)? deleteTextMessage,
  }) {
    return sendTextMessage?.call(textMessageEntity, channelId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String channelId)? getMessages,
    TResult Function(TextMessageEntity textMessageEntity, String channelId)?
        sendTextMessage,
    TResult Function(String channelId, String messageId)? deleteTextMessage,
    required TResult orElse(),
  }) {
    if (sendTextMessage != null) {
      return sendTextMessage(textMessageEntity, channelId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMessagesEvent value) getMessages,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_DeleteTextMessage value) deleteTextMessage,
  }) {
    return sendTextMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMessagesEvent value)? getMessages,
    TResult? Function(_SendTextMessage value)? sendTextMessage,
    TResult? Function(_DeleteTextMessage value)? deleteTextMessage,
  }) {
    return sendTextMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMessagesEvent value)? getMessages,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_DeleteTextMessage value)? deleteTextMessage,
    required TResult orElse(),
  }) {
    if (sendTextMessage != null) {
      return sendTextMessage(this);
    }
    return orElse();
  }
}

abstract class _SendTextMessage extends ChatEvent {
  const factory _SendTextMessage(
      {required final TextMessageEntity textMessageEntity,
      required final String channelId}) = _$_SendTextMessage;
  const _SendTextMessage._() : super._();

  TextMessageEntity get textMessageEntity;
  @override
  String get channelId;
  @override
  @JsonKey(ignore: true)
  _$$_SendTextMessageCopyWith<_$_SendTextMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteTextMessageCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$$_DeleteTextMessageCopyWith(_$_DeleteTextMessage value,
          $Res Function(_$_DeleteTextMessage) then) =
      __$$_DeleteTextMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String channelId, String messageId});
}

/// @nodoc
class __$$_DeleteTextMessageCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_DeleteTextMessage>
    implements _$$_DeleteTextMessageCopyWith<$Res> {
  __$$_DeleteTextMessageCopyWithImpl(
      _$_DeleteTextMessage _value, $Res Function(_$_DeleteTextMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? messageId = null,
  }) {
    return _then(_$_DeleteTextMessage(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteTextMessage extends _DeleteTextMessage {
  const _$_DeleteTextMessage({required this.channelId, required this.messageId})
      : super._();

  @override
  final String channelId;
  @override
  final String messageId;

  @override
  String toString() {
    return 'ChatEvent.deleteTextMessage(channelId: $channelId, messageId: $messageId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteTextMessage &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, messageId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteTextMessageCopyWith<_$_DeleteTextMessage> get copyWith =>
      __$$_DeleteTextMessageCopyWithImpl<_$_DeleteTextMessage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String channelId) getMessages,
    required TResult Function(
            TextMessageEntity textMessageEntity, String channelId)
        sendTextMessage,
    required TResult Function(String channelId, String messageId)
        deleteTextMessage,
  }) {
    return deleteTextMessage(channelId, messageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String channelId)? getMessages,
    TResult? Function(TextMessageEntity textMessageEntity, String channelId)?
        sendTextMessage,
    TResult? Function(String channelId, String messageId)? deleteTextMessage,
  }) {
    return deleteTextMessage?.call(channelId, messageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String channelId)? getMessages,
    TResult Function(TextMessageEntity textMessageEntity, String channelId)?
        sendTextMessage,
    TResult Function(String channelId, String messageId)? deleteTextMessage,
    required TResult orElse(),
  }) {
    if (deleteTextMessage != null) {
      return deleteTextMessage(channelId, messageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMessagesEvent value) getMessages,
    required TResult Function(_SendTextMessage value) sendTextMessage,
    required TResult Function(_DeleteTextMessage value) deleteTextMessage,
  }) {
    return deleteTextMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMessagesEvent value)? getMessages,
    TResult? Function(_SendTextMessage value)? sendTextMessage,
    TResult? Function(_DeleteTextMessage value)? deleteTextMessage,
  }) {
    return deleteTextMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMessagesEvent value)? getMessages,
    TResult Function(_SendTextMessage value)? sendTextMessage,
    TResult Function(_DeleteTextMessage value)? deleteTextMessage,
    required TResult orElse(),
  }) {
    if (deleteTextMessage != null) {
      return deleteTextMessage(this);
    }
    return orElse();
  }
}

abstract class _DeleteTextMessage extends ChatEvent {
  const factory _DeleteTextMessage(
      {required final String channelId,
      required final String messageId}) = _$_DeleteTextMessage;
  const _DeleteTextMessage._() : super._();

  @override
  String get channelId;
  String get messageId;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteTextMessageCopyWith<_$_DeleteTextMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TextMessageEntity> messages) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TextMessageEntity> messages)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TextMessageEntity> messages)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatInitialState value) initial,
    required TResult Function(_ChatLoadingState value) loading,
    required TResult Function(_ChatLoadedState value) loaded,
    required TResult Function(_ChatErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatInitialState value)? initial,
    TResult? Function(_ChatLoadingState value)? loading,
    TResult? Function(_ChatLoadedState value)? loaded,
    TResult? Function(_ChatErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatInitialState value)? initial,
    TResult Function(_ChatLoadingState value)? loading,
    TResult Function(_ChatLoadedState value)? loaded,
    TResult Function(_ChatErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ChatInitialStateCopyWith<$Res> {
  factory _$$_ChatInitialStateCopyWith(
          _$_ChatInitialState value, $Res Function(_$_ChatInitialState) then) =
      __$$_ChatInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ChatInitialStateCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_ChatInitialState>
    implements _$$_ChatInitialStateCopyWith<$Res> {
  __$$_ChatInitialStateCopyWithImpl(
      _$_ChatInitialState _value, $Res Function(_$_ChatInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ChatInitialState extends _ChatInitialState {
  const _$_ChatInitialState() : super._();

  @override
  String toString() {
    return 'ChatState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ChatInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TextMessageEntity> messages) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TextMessageEntity> messages)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TextMessageEntity> messages)? loaded,
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
    required TResult Function(_ChatInitialState value) initial,
    required TResult Function(_ChatLoadingState value) loading,
    required TResult Function(_ChatLoadedState value) loaded,
    required TResult Function(_ChatErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatInitialState value)? initial,
    TResult? Function(_ChatLoadingState value)? loading,
    TResult? Function(_ChatLoadedState value)? loaded,
    TResult? Function(_ChatErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatInitialState value)? initial,
    TResult Function(_ChatLoadingState value)? loading,
    TResult Function(_ChatLoadedState value)? loaded,
    TResult Function(_ChatErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ChatInitialState extends ChatState {
  const factory _ChatInitialState() = _$_ChatInitialState;
  const _ChatInitialState._() : super._();
}

/// @nodoc
abstract class _$$_ChatLoadingStateCopyWith<$Res> {
  factory _$$_ChatLoadingStateCopyWith(
          _$_ChatLoadingState value, $Res Function(_$_ChatLoadingState) then) =
      __$$_ChatLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ChatLoadingStateCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_ChatLoadingState>
    implements _$$_ChatLoadingStateCopyWith<$Res> {
  __$$_ChatLoadingStateCopyWithImpl(
      _$_ChatLoadingState _value, $Res Function(_$_ChatLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ChatLoadingState extends _ChatLoadingState {
  const _$_ChatLoadingState() : super._();

  @override
  String toString() {
    return 'ChatState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ChatLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TextMessageEntity> messages) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TextMessageEntity> messages)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TextMessageEntity> messages)? loaded,
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
    required TResult Function(_ChatInitialState value) initial,
    required TResult Function(_ChatLoadingState value) loading,
    required TResult Function(_ChatLoadedState value) loaded,
    required TResult Function(_ChatErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatInitialState value)? initial,
    TResult? Function(_ChatLoadingState value)? loading,
    TResult? Function(_ChatLoadedState value)? loaded,
    TResult? Function(_ChatErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatInitialState value)? initial,
    TResult Function(_ChatLoadingState value)? loading,
    TResult Function(_ChatLoadedState value)? loaded,
    TResult Function(_ChatErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ChatLoadingState extends ChatState {
  const factory _ChatLoadingState() = _$_ChatLoadingState;
  const _ChatLoadingState._() : super._();
}

/// @nodoc
abstract class _$$_ChatLoadedStateCopyWith<$Res> {
  factory _$$_ChatLoadedStateCopyWith(
          _$_ChatLoadedState value, $Res Function(_$_ChatLoadedState) then) =
      __$$_ChatLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TextMessageEntity> messages});
}

/// @nodoc
class __$$_ChatLoadedStateCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_ChatLoadedState>
    implements _$$_ChatLoadedStateCopyWith<$Res> {
  __$$_ChatLoadedStateCopyWithImpl(
      _$_ChatLoadedState _value, $Res Function(_$_ChatLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$_ChatLoadedState(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<TextMessageEntity>,
    ));
  }
}

/// @nodoc

class _$_ChatLoadedState extends _ChatLoadedState {
  const _$_ChatLoadedState({required final List<TextMessageEntity> messages})
      : _messages = messages,
        super._();

  final List<TextMessageEntity> _messages;
  @override
  List<TextMessageEntity> get messages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatState.loaded(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatLoadedState &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatLoadedStateCopyWith<_$_ChatLoadedState> get copyWith =>
      __$$_ChatLoadedStateCopyWithImpl<_$_ChatLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TextMessageEntity> messages) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TextMessageEntity> messages)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TextMessageEntity> messages)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatInitialState value) initial,
    required TResult Function(_ChatLoadingState value) loading,
    required TResult Function(_ChatLoadedState value) loaded,
    required TResult Function(_ChatErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatInitialState value)? initial,
    TResult? Function(_ChatLoadingState value)? loading,
    TResult? Function(_ChatLoadedState value)? loaded,
    TResult? Function(_ChatErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatInitialState value)? initial,
    TResult Function(_ChatLoadingState value)? loading,
    TResult Function(_ChatLoadedState value)? loaded,
    TResult Function(_ChatErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _ChatLoadedState extends ChatState {
  const factory _ChatLoadedState(
      {required final List<TextMessageEntity> messages}) = _$_ChatLoadedState;
  const _ChatLoadedState._() : super._();

  List<TextMessageEntity> get messages;
  @JsonKey(ignore: true)
  _$$_ChatLoadedStateCopyWith<_$_ChatLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChatErrorStateCopyWith<$Res> {
  factory _$$_ChatErrorStateCopyWith(
          _$_ChatErrorState value, $Res Function(_$_ChatErrorState) then) =
      __$$_ChatErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_ChatErrorStateCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_ChatErrorState>
    implements _$$_ChatErrorStateCopyWith<$Res> {
  __$$_ChatErrorStateCopyWithImpl(
      _$_ChatErrorState _value, $Res Function(_$_ChatErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_ChatErrorState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChatErrorState extends _ChatErrorState {
  const _$_ChatErrorState({this.message = 'Произошла ошибка'}) : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'ChatState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatErrorStateCopyWith<_$_ChatErrorState> get copyWith =>
      __$$_ChatErrorStateCopyWithImpl<_$_ChatErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TextMessageEntity> messages) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TextMessageEntity> messages)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TextMessageEntity> messages)? loaded,
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
    required TResult Function(_ChatInitialState value) initial,
    required TResult Function(_ChatLoadingState value) loading,
    required TResult Function(_ChatLoadedState value) loaded,
    required TResult Function(_ChatErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatInitialState value)? initial,
    TResult? Function(_ChatLoadingState value)? loading,
    TResult? Function(_ChatLoadedState value)? loaded,
    TResult? Function(_ChatErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatInitialState value)? initial,
    TResult Function(_ChatLoadingState value)? loading,
    TResult Function(_ChatLoadedState value)? loaded,
    TResult Function(_ChatErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ChatErrorState extends ChatState {
  const factory _ChatErrorState({final String message}) = _$_ChatErrorState;
  const _ChatErrorState._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$_ChatErrorStateCopyWith<_$_ChatErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
