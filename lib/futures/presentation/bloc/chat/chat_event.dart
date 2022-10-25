import 'package:equatable/equatable.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// abstract class ChatEvent extends Equatable {
//   const ChatEvent();
// }

// class GetMessagesEvent extends ChatEvent {
//   final String channelId;

//   const GetMessagesEvent({required this.channelId});
//   @override
//   List<Object?> get props => [channelId];
// }

// class SendTextMessageEvent extends ChatEvent {
//   final TextMessageEntity textMessageEntity;
//   final String channelId;

//   const SendTextMessageEvent(
//       {required this.textMessageEntity, required this.channelId});
//   @override
//   List<Object?> get props => [textMessageEntity, channelId];
// }

// class DeleteTextMessage extends ChatEvent {
//   final String channelId;
//   final String messageId;

//   const DeleteTextMessage({required this.channelId, required this.messageId});
//   @override
//   List<Object?> get props => [channelId, messageId];
// }

// @freezed
// class ChatEvent with _$ChatEvent {
//   const ChatEvent._();

//   const factory ChatEvent.getMessages({required final String channelId}) =
//       GetMessagesEvent;

//   const factory ChatEvent.sendTextMessage({
//     required final TextMessageEntity textMessageEntity,
//     required final String channelId,
//   }) = SendTextMessage;

//   const factory ChatEvent.deleteTextMessage({
//     required final String channelId,
//     required final String messageId,
//   }) = DeleteTextMessage;
// }
