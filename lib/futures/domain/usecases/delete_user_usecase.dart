import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class DeleteUserUseCase {
  final FirebaseRepository repository;

  DeleteUserUseCase({required this.repository});

  Future<void> call(String userId) async {
    return await repository.deleteUser(userId);
  }
}
