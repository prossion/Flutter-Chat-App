import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class ForgotPasswordUseCase {
  final FirebaseRepository repository;

  ForgotPasswordUseCase({required this.repository});

  Future<void> call(String email) {
    return repository.forgotPassword(email);
  }
}
