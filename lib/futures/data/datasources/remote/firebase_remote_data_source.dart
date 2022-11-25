import 'package:flutter_social_app/futures/domain/entites/entites.dart';

abstract class FirebaseRemoteDataSource {
  Future<void> getCreateCurrentUser(UserEntity user);

  Future<void> getCreateGroup(GroupEntity groupEntity);

  Future<void> joinGroup(GroupEntity groupEntity);

  Future<void> updateGroup(GroupEntity groupEntity);

  Stream<List<GroupEntity>> getGroups();

  Future<void> forgotPassword(String email);

  Future<void> signIn(UserEntity user);

  Future<void> signUp(UserEntity user);

  Future<void> getUpdateUser(UserEntity user);

  Future<void> googleAuth();

  Future<bool> isSignIn();

  Future<void> signOut();

  Future<String> getCurrentUId();

  Stream<List<UserEntity>> getAllUsers();

  Future<void> sendTextMessage(
      TextMessageEntity textMessageEntity, String channelId);

  Future<void> deleteTextMessage(String channelId, String messageId);

  Future<void> deleteUser(String userId);

  Stream<List<TextMessageEntity>> getMessages(String channelId);

  Future<void> updateDataFirestore(String collectionPath, String docPath,
      Map<String, dynamic> dataNeedUpdate);

  Future<void> joinChatMessage(String groupChatId);
}
