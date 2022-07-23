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
  Future<String> createOneToOneChatChannel(EngageUserEntity engageUserEntity);
  Future<String> getChannelId(EngageUserEntity engageUserEntity);
  Future<void> sendTextMessage(
      TextMessageEntity textMessageEntity, String channelId);
  Stream<List<TextMessageEntity>> getMessages(String channelId);
  Future<void> addToMyChat(ChatEntity chatEntity);
  Stream<List<ChatEntity>> getMyChat(String uid);
  Future<void> createNewGroup(
      ChatEntity myChatEntity, List<String> selectUserList);
  Future<void> getCreateNewGroupChatRoom(
      ChatEntity myChatEntity, List<String> selectUserList);
}
