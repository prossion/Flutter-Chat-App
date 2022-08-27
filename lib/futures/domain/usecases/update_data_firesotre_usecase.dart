import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class UpdateDataFirestoreUseCase {
  final FirebaseRepository repository;

  UpdateDataFirestoreUseCase({required this.repository});

  Future<void> call(String collectionPath, String docPath,
      Map<String, dynamic> dataNeedUpdate) {
    return repository.updateDataFirestore(
        collectionPath, docPath, dataNeedUpdate);
  }
}
