import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class GetAllUsersUsecase {
  final FirebaseRepository repository;

  GetAllUsersUsecase({required this.repository});

  Stream<List<UserEntity>> call() {
    return repository.getAllUsers();
  }
}
