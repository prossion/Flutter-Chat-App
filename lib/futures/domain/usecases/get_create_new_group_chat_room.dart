import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class GetCreateNewGroupChatRoomUseCase {
  final FirebaseRepository repository;

  GetCreateNewGroupChatRoomUseCase({required this.repository});

  Future<void> call(ChatEntity myChatEntity, List<String> selectUserList) {
    return repository.getCreateNewGroupChatRoom(myChatEntity, selectUserList);
  }
}
