import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_social_app/futures/domain/entites/text_message_entity.dart';

class TextMessageModel extends TextMessageEntity {
  const TextMessageModel({
    String? recipientId,
    String? senderId,
    String? senderName,
    String? type,
    Timestamp? time,
    String? content,
    String? receiverName,
    String? replyingMessage,
    String? messageId,
  }) : super(
          recipientId: recipientId,
          senderId: senderId,
          senderName: senderName,
          type: type,
          time: time,
          content: content,
          receiverName: receiverName,
          replyingMessage: replyingMessage,
          messageId: messageId,
        );

  factory TextMessageModel.fromSnapshot(DocumentSnapshot snapshot) {
    return TextMessageModel(
      recipientId: snapshot.data().toString().contains('recipientId')
          ? snapshot.get('recipientId')
          : '',
      senderId: snapshot.data().toString().contains('senderId')
          ? snapshot.get('senderId')
          : '',
      senderName: snapshot.data().toString().contains('senderName')
          ? snapshot.get('senderName')
          : '',
      type: snapshot.data().toString().contains('type')
          ? snapshot.get('type')
          : '',
      time: snapshot.data().toString().contains('time')
          ? snapshot.get('time')
          : '',
      content: snapshot.data().toString().contains('content')
          ? snapshot.get('content')
          : '',
      receiverName: snapshot.data().toString().contains('receiverName')
          ? snapshot.get('receiverName')
          : '',
      replyingMessage: snapshot.data().toString().contains('replyingMessage')
          ? snapshot.get('replyingMessage')
          : null,
      messageId: snapshot.data().toString().contains('messageId')
          ? snapshot.get('messageId')
          : '',
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "recipientId": recipientId,
      "senderId": senderId,
      "senderName": senderName,
      "type": type,
      "time": time,
      "content": content,
      "receiverName": receiverName,
      "replyingMessage": replyingMessage,
      "messageId": messageId,
    };
  }
}
