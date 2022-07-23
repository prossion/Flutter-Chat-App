import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class GroupEntity extends Equatable {
  final String groupName;
  final String groupProfileImage;
  final String joinUsers;
  final String limitUsers;
  final Timestamp? creationTime;
  final String groupId;
  final String uid;
  final String lastMessage;

  const GroupEntity({
    this.groupName = "",
    this.groupProfileImage = "",
    this.joinUsers = "",
    this.limitUsers = "",
    this.creationTime,
    this.groupId = "",
    this.uid = "",
    this.lastMessage = "",
  });

  @override
  List<Object> get props => [
        groupName,
        groupProfileImage,
        joinUsers,
        uid,
        limitUsers,
        creationTime!,
        groupId,
        lastMessage,
      ];
}
