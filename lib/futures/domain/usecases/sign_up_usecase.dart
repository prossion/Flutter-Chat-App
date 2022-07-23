import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class SignUpUseCase {
  final FirebaseRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.signUp(user);
  }
}
