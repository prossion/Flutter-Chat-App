import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class SignOutUseCase {
  final FirebaseRepository repository;

  SignOutUseCase({required this.repository});

  Future<void> call() async {
    return repository.signOut();
  }
}
