import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_social_app/futures/domain/entites/chat_messages_entity.dart';

class ChatMessagesModel extends ChatMessagesEntity {
  ChatMessagesModel({
    final String idFrom = '',
    final String idTo = '',
    final String timestamp = '',
    final String content = '',
    final int type = 0,
  }) : super(
          idFrom: idFrom,
          idTo: idTo,
          timestamp: timestamp,
          content: content,
          type: type,
        );

  Map<String, dynamic> toJson() {
    return {
      "idFrom": idFrom,
      "idTo": idTo,
      "timestamp": timestamp,
      "content": content,
      "type": type,
    };
  }

  factory ChatMessagesModel.fromDocument(DocumentSnapshot documentSnapshot) {
    return ChatMessagesModel(
      idFrom: documentSnapshot.data().toString().contains('idFrom')
          ? documentSnapshot.get('idFrom')
          : '',
      idTo: documentSnapshot.data().toString().contains('idTo')
          ? documentSnapshot.get('idTo')
          : '',
      timestamp: documentSnapshot.data().toString().contains('timestamp')
          ? documentSnapshot.get('timestamp')
          : '',
      content: documentSnapshot.data().toString().contains('content')
          ? documentSnapshot.get('content')
          : '',
      type: documentSnapshot.data().toString().contains('type')
          ? documentSnapshot.get('type')
          : 0,
    );
  }
}
