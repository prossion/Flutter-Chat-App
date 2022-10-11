import 'package:flutter_social_app/futures/data/datasources/remote/firebase_remote_data_source.dart';
import 'package:flutter_social_app/futures/domain/entites/group_entity.dart';
import 'package:flutter_social_app/futures/domain/entites/user_entity.dart';
import 'package:flutter_social_app/futures/domain/entites/text_message_entity.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> forgotPassword(String email) async =>
      await remoteDataSource.forgotPassword(email);

  @override
  Stream<List<UserEntity>> getAllUsers() => remoteDataSource.getAllUsers();

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
  Future<void> deleteTextMessage(String channelId, String messageId) async =>
      await remoteDataSource.deleteTextMessage(channelId, messageId);

  @override
  Future<void> deleteUser(String userId) async =>
      await remoteDataSource.deleteUser(userId);

  @override
  Future<void> signIn(UserEntity user) async =>
      await remoteDataSource.signIn(user);

  @override
  Future<void> signOut() async => await remoteDataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) async => remoteDataSource.signUp(user);

  @override
  Future<void> getCreateGroup(GroupEntity groupEntity) async =>
      remoteDataSource.getCreateGroup(groupEntity);

  @override
  Stream<List<GroupEntity>> getGroups() => remoteDataSource.getGroups();

  @override
  Future<void> joinGroup(GroupEntity groupEntity) async =>
      remoteDataSource.joinGroup(groupEntity);

  @override
  Future<void> updateGroup(GroupEntity groupEntity) async =>
      remoteDataSource.updateGroup(groupEntity);
  @override
  Future<void> updateDataFirestore(String collectionPath, String docPath,
          Map<String, dynamic> dataNeedUpdate) =>
      remoteDataSource.updateDataFirestore(
          collectionPath, docPath, dataNeedUpdate);

  @override
  Future<void> joinChatMessage(String groupChatId) async =>
      remoteDataSource.joinChatMessage(groupChatId);
}
