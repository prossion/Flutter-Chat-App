import 'package:flutter_social_app/futures/data/model/chat_messages_model.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class GetChatMessageUsecase {
  final FirebaseRepository repository;

  GetChatMessageUsecase({required this.repository});

  Stream<List<ChatMessagesModel>> call(String groupChatId, int limit) {
    return repository.getChatMessage(groupChatId, limit);
  }
}
