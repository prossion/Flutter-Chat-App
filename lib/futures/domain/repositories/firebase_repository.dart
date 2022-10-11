import 'package:flutter_social_app/futures/domain/entites/entites.dart';

abstract class FirebaseRepository {
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<void> googleAuth();
  Future<void> forgotPassword(String email);

  Future<void> getCreateGroup(GroupEntity groupEntity);
  Stream<List<GroupEntity>> getGroups();
  Future<void> joinGroup(GroupEntity groupEntity);
  Future<void> updateGroup(GroupEntity groupEntity);

  Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<void> getUpdateUser(UserEntity user);
  Future<String> getCurrentUId();
  Stream<List<UserEntity>> getAllUsers();

  Future<void> sendTextMessage(
      TextMessageEntity textMessageEntity, String channelId);
  Stream<List<TextMessageEntity>> getMessages(String channelId);
  Future<void> deleteTextMessage(String channelId, String messageId);
  Future<void> deleteUser(String userId);
  Future<void> updateDataFirestore(String collectionPath, String docPath,
      Map<String, dynamic> dataNeedUpdate);
  Future<void> joinChatMessage(String groupChatId);
}
