import 'package:flutter_social_app/futures/domain/entites/engage_user_entity.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class CreateOneToOneChatChannelUsecase {
  final FirebaseRepository repository;

  CreateOneToOneChatChannelUsecase({required this.repository});

  Future<String> call(EngageUserEntity engageUserEntity) async {
    return repository.createOneToOneChatChannel(engageUserEntity);
  }
}
