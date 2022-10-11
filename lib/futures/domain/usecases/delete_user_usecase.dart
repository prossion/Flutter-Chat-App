import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class DeleteUserUsecase {
  final FirebaseRepository repository;

  DeleteUserUsecase({required this.repository});

  Future<void> call(String userId) async {
    return await repository.deleteUser(userId);
  }
}
