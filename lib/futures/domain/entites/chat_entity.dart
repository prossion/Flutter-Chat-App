import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatEntity extends Equatable {
  final String? senderName;
  final String? recipientName;
  final String? channelId;
  final String? recipientUid;
  final String? senderUid;
  final String? profileUrl;
  final String? recentTextMessage;
  final bool? isRead;
  final Timestamp? time;
  final bool? isArchived;
  final String? recipientPhoneNumber;
  final String? senderPhoneNumber;
  final String? subjectName;
  final String? communicationType;

  const ChatEntity({
    this.senderName,
    this.recipientName,
    this.channelId,
    this.recipientUid,
    this.senderUid,
    this.profileUrl,
    this.recentTextMessage,
    this.isRead,
    this.time,
    this.isArchived,
    this.recipientPhoneNumber,
    this.senderPhoneNumber,
    this.subjectName,
    this.communicationType,
  });

  @override
  List<Object?> get props => [
        senderName!,
        recipientName!,
        channelId!,
        recipientUid!,
        senderUid!,
        profileUrl!,
        recentTextMessage!,
        isRead!,
        time!,
        isArchived!,
        recipientPhoneNumber!,
        senderPhoneNumber!,
        subjectName!,
        communicationType!,
      ];
}
