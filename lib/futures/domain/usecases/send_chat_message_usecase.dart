import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class SendChatMessageUsecase {
  final FirebaseRepository repository;

  SendChatMessageUsecase({required this.repository});

  Future<void> call(String content, int type, String groupChatId,
      String currentUserId, String peerId) {
    return repository.sendChatMessage(
        content, type, groupChatId, currentUserId, peerId);
  }
}
