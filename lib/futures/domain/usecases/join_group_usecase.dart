import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class JoinGroupUseCase {
  final FirebaseRepository repository;

  JoinGroupUseCase({required this.repository});

  Future<void> call(GroupEntity groupEntity) async {
    return await repository.joinGroup(groupEntity);
  }
}
