import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class CreateNewGroupUseCase {
  final FirebaseRepository repository;

  CreateNewGroupUseCase({required this.repository});

  Future<void> call(
      ChatEntity myChatEntity, List<String> selectUserList) async {
    return repository.createNewGroup(myChatEntity, selectUserList);
  }
}
