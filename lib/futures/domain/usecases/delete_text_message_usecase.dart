import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class DeleteTextMessageUseCase {
  final FirebaseRepository repository;

  DeleteTextMessageUseCase({required this.repository});

  Future<void> call(String channelId, String messageId) async {
    return await repository.deleteTextMessage(channelId, messageId);
  }
}
