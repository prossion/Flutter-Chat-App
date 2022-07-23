import 'package:flutter_social_app/futures/data/datasources/remote/firebase_remote_data_source.dart';
import 'package:flutter_social_app/futures/domain/entites/group_entity.dart';
import 'package:flutter_social_app/futures/domain/entites/user_entity.dart';
import 'package:flutter_social_app/futures/domain/entites/text_message_entity.dart';
import 'package:flutter_social_app/futures/domain/entites/engage_user_entity.dart';
import 'package:flutter_social_app/futures/domain/entites/chat_entity.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addToMyChat(ChatEntity chatEntity) async =>
      await remoteDataSource.addToMyChat(chatEntity);

  @override
  Future<String> createOneToOneChatChannel(
          EngageUserEntity engageUserEntity) async =>
      remoteDataSource.createOneToOneChatChannel(engageUserEntity);

  @override
  Future<void> forgotPassword(String email) async =>
      await remoteDataSource.forgotPassword(email);

  @override
  Stream<List<UserEntity>> getAllUsers() => remoteDataSource.getAllUsers();

  @override
  Future<String> getChannelId(EngageUserEntity engageUserEntity) async =>
      remoteDataSource.getChannelId(engageUserEntity);

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      await remoteDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUId() async =>
      await remoteDataSource.getCurrentUId();

  @override
  Stream<List<TextMessageEntity>> getMessages(String channelId) =>
      remoteDataSource.getMessages(channelId);

  @override
  Stream<List<ChatEntity>> getMyChat(String uid) =>
      remoteDataSource.getMyChat(uid);

  @override
  Future<void> getUpdateUser(UserEntity user) async =>
      await remoteDataSource.getUpdateUser(user);

  @override
  Future<void> googleAuth() async => await remoteDataSource.googleAuth();

  @override
  Future<bool> isSignIn() async => await remoteDataSource.isSignIn();

  @override
  Future<void> sendTextMessage(
          TextMessageEntity textMessageEntity, String channelId) async =>
      await remoteDataSource.sendTextMessage(textMessageEntity, channelId);

  @override
  Future<void> signIn(UserEntity user) async =>
      await remoteDataSource.signIn(user);

  @override
  Future<void> signOut() async => await remoteDataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) async => remoteDataSource.signUp(user);

  @override
  Future<void> createNewGroup(
          ChatEntity myChatEntity, List<String> selectUserList) async =>
      remoteDataSource.createNewGroup(myChatEntity, selectUserList);

  @override
  Future<void> getCreateGroup(GroupEntity groupEntity) async =>
      remoteDataSource.getCreateGroup(groupEntity);

  @override
  Future<void> getCreateNewGroupChatRoom(
          ChatEntity myChatEntity, List<String> selectUserList) async =>
      remoteDataSource.createNewGroup(myChatEntity, selectUserList);

  @override
  Stream<List<GroupEntity>> getGroups() => remoteDataSource.getGroups();

  @override
  Future<void> joinGroup(GroupEntity groupEntity) async =>
      remoteDataSource.joinGroup(groupEntity);

  @override
  Future<void> updateGroup(GroupEntity groupEntity) async =>
      remoteDataSource.updateGroup(groupEntity);
}
