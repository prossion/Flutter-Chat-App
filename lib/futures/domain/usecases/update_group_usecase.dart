import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class UpdateGroupUseCase {
  final FirebaseRepository repository;

  UpdateGroupUseCase({required this.repository});
  Future<void> call(GroupEntity groupEntity) {
    return repository.updateGroup(groupEntity);
  }
}
