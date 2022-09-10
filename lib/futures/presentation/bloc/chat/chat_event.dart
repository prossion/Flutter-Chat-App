import 'package:equatable/equatable.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class GetMessagesEvent extends ChatEvent {
  final String channelId;

  const GetMessagesEvent({required this.channelId});
  @override
  List<Object?> get props => [channelId];
}

class SendTextMessageEvent extends ChatEvent {
  final TextMessageEntity textMessageEntity;
  final String channelId;

  const SendTextMessageEvent(
      {required this.textMessageEntity, required this.channelId});
  @override
  List<Object?> get props => [textMessageEntity, channelId];
}

class DeleteTextMessage extends ChatEvent {
  final String channelId;

  const DeleteTextMessage({required this.channelId});
  @override
  List<Object?> get props => [channelId];
}
