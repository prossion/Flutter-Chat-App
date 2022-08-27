import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class JoinChatMessageUseCase {
  final FirebaseRepository repository;

  JoinChatMessageUseCase({required this.repository});

  Future<void> call(String groupChatId) async {
    return await repository.joinChatMessage(groupChatId);
  }
}
