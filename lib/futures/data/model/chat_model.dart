import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_social_app/futures/domain/entites/chat_entity.dart';

class ChatModel extends ChatEntity {
  const ChatModel({
    String? senderName,
    String? recipientName,
    String? channelId,
    String? recipientUid,
    String? senderUid,
    String? profileUrl,
    String? recentTextMessage,
    bool? isRead,
    Timestamp? time,
    bool? isArchived,
    String? recipientPhoneNumber,
    String? senderPhoneNumber,
    String? subjectName,
    String? communicationType,
  }) : super(
            senderName: senderName,
            recipientName: recipientName,
            channelId: channelId,
            recipientUid: recipientUid,
            senderUid: senderUid,
            profileUrl: profileUrl,
            recentTextMessage: recentTextMessage,
            isRead: isRead,
            time: time,
            isArchived: isArchived,
            recipientPhoneNumber: recipientPhoneNumber,
            senderPhoneNumber: senderPhoneNumber,
            subjectName: subjectName,
            communicationType: communicationType);

  factory ChatModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ChatModel(
      senderName: snapshot.get('senderName'),
      recipientName: snapshot.get('recipientName'),
      channelId: snapshot.get('channelId'),
      recipientUid: snapshot.get('recipientUID'),
      senderUid: snapshot.get('senderUID'),
      profileUrl: snapshot.get('profileUrl'),
      recentTextMessage: snapshot.get('recentTextMessage'),
      isRead: snapshot.get('isRead'),
      time: snapshot.get('time'),
      isArchived: snapshot.get('isArchived'),
      recipientPhoneNumber: snapshot.get('recipientPhoneNumber'),
      senderPhoneNumber: snapshot.get('senderPhoneNumber'),
      subjectName: snapshot.get('subjectName'),
      communicationType: snapshot.get('communicationType'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "senderName": senderName,
      "recipientName": recipientName,
      "channelId": channelId,
      "recipientUID": recipientUid,
      "senderUID": senderUid,
      "profileUrl": profileUrl,
      "recentTextMessage": recentTextMessage,
      "isRead": isRead,
      "time": time,
      "isArchived": isArchived,
      "recipientPhoneNumber": recipientPhoneNumber,
      "senderPhoneNumber": senderPhoneNumber,
      "subjectName": subjectName,
      "communicationType": communicationType
    };
  }
}
