import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class GoogleSignInUseCase {
  final FirebaseRepository repository;

  GoogleSignInUseCase({required this.repository});

  Future<void> call() {
    return repository.googleAuth();
  }
}
