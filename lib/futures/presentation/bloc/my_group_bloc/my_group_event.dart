import 'package:equatable/equatable.dart';

abstract class MyGroupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class JoinMyGroupEvent extends MyGroupEvent {
  final String groupChatId;

  JoinMyGroupEvent({
    required this.groupChatId,
  });

  @override
  List<Object?> get props => [
        groupChatId,
      ];
}

class UpdateDataFirestoreEvent extends MyGroupEvent {
  final String collectionPath;
  final String docPath;
  final Map<String, dynamic> dataNeedUpdate;

  UpdateDataFirestoreEvent({
    required this.collectionPath,
    required this.docPath,
    required this.dataNeedUpdate,
  });

  @override
  List<Object?> get props => [collectionPath, docPath, dataNeedUpdate];
}
