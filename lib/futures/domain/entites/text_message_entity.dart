import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TextMessageEntity extends Equatable {
  final String? recipientId;
  final String? senderId;
  final String? senderName;
  final String? type;
  final Timestamp? time;
  final String? content;
  final String? receiverName;
  final String? replyingMessage;
  final String? messageId;

  const TextMessageEntity({
    this.recipientId,
    this.senderId,
    this.senderName,
    this.type,
    this.time,
    this.content,
    this.receiverName,
    this.replyingMessage,
    this.messageId,
  });

  @override
  List<Object?> get props => [
        recipientId!,
        senderId!,
        senderName!,
        type!,
        time!,
        content!,
        receiverName!,
        replyingMessage,
        messageId!,
      ];
}
