import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class GetChannelIdUseCase {
  final FirebaseRepository repository;

  GetChannelIdUseCase({required this.repository});

  Future<String> call(EngageUserEntity engageUserEntity) async {
    return repository.getChannelId(engageUserEntity);
  }
}
