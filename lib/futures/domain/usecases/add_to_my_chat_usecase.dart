import 'package:flutter_social_app/futures/domain/entites/chat_entity.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class AddToMyChatUseCase {
  final FirebaseRepository repository;

  AddToMyChatUseCase({required this.repository});

  Future<void> call(ChatEntity chatEntity) async {
    return await repository.addToMyChat(chatEntity);
  }
}
