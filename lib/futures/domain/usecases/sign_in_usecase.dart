import 'package:flutter_social_app/futures/domain/entites/user_entity.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class SignInUseCase {
  final FirebaseRepository repository;

  SignInUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.signIn(user);
  }
}
