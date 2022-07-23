import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class GetMyChatUseCase {
  final FirebaseRepository repository;

  GetMyChatUseCase({required this.repository});

  Stream<List<ChatEntity>> call(String uid) {
    return repository.getMyChat(uid);
  }
}
