// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_social_app/futures/data/datasources/remote/firebase_remote_data_source.dart';
import 'package:flutter_social_app/futures/data/model/group_model.dart';
import 'package:flutter_social_app/futures/data/model/text_message_model.dart';
import 'package:flutter_social_app/futures/data/model/user_model.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  FirebaseRemoteDataSourceImpl(this.firestore, this.auth, this.googleSignIn);

  // USERS AND AUTHENTICATION
  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollection = firestore.collection("users");
    final uid = await getCurrentUId();
    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
        name: user.name,
        uid: uid,
        phoneNumber: user.phoneNumber,
        email: user.email,
        photoUrl: user.photoUrl,
        isOnline: user.isOnline,
        status: user.status,
      ).toDocument();
      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
        return;
      } else {
        userCollection.doc(uid).update(newUser);
        print("user already exist");
        return;
      }
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Future<void> getUpdateUser(UserEntity user) async {
    Map<String, dynamic> userInformation = {};
    print(user.name);
    final userCollection = firestore.collection("users");

    if (user.photoUrl != "") {
      userInformation['photoUrl'] = user.photoUrl;
    }
    if (user.status != "") {
      userInformation['status'] = user.status;
    }
    if (user.phoneNumber != "") {
      userInformation["phoneNumber"] = user.phoneNumber;
    }
    if (user.name != "") {
      userInformation["name"] = user.name;
    }

    userCollection.doc(user.uid).update(userInformation);
  }

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<void> googleAuth() async {
    final usersCollection = firestore.collection("users");

    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await account!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final information = (await auth.signInWithCredential(credential)).user;
      usersCollection.doc(auth.currentUser!.uid).get().then((user) async {
        if (!user.exists) {
          var uid = auth.currentUser!.uid;
          var newUser = UserModel(
                  name: information!.displayName!,
                  email: information.email!,
                  phoneNumber: information.phoneNumber == null
                      ? ""
                      : information.phoneNumber!,
                  photoUrl:
                      information.photoURL == null ? "" : information.photoURL!,
                  isOnline: false,
                  status: "",
                  uid: information.uid)
              .toDocument();

          usersCollection.doc(uid).set(newUser);
        }
      }).whenComplete(() {
        print("New User Created Successfully");
      }).catchError((e) {
        print("getInitializeCreateCurrentUser ${e.toString()}");
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signIn(UserEntity user) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  @override
  Future<void> signUp(UserEntity user) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  // USERS AND AUTHENTICATION

  // CHAT
  @override
  Stream<List<UserEntity>> getAllUsers() {
    final userCollection = firestore.collection("users");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Future<void> sendTextMessage(
      TextMessageEntity textMessageEntity, String channelId) async {
    final messagesRef = firestore
        .collection("groupChatChannel")
        .doc(channelId)
        .collection("messages");

    final messageId = messagesRef.doc().id;

    final newMessage = TextMessageModel(
      content: textMessageEntity.content,
      receiverName: textMessageEntity.receiverName,
      recipientId: textMessageEntity.recipientId,
      senderId: textMessageEntity.senderId,
      senderName: textMessageEntity.senderName,
      time: textMessageEntity.time,
      type: textMessageEntity.type,
      replyingMessage: textMessageEntity.replyingMessage,
      messageId: messageId,
    ).toDocument();

    messagesRef.doc(messageId).set(newMessage);
    print('messageId: $messageId');
  }

  @override
  Future<void> deleteTextMessage(String channelId, String messageId) async {
    final messagesRef = firestore
        .collection("groupChatChannel")
        .doc(channelId)
        .collection("messages");

    // final messageId = messagesRef.doc(messageId);
    print('id: $messageId');
    messagesRef.doc(messageId).delete().then((doc) => print('Message delete'),
        onError: (e) => print("Error updating document $e"));
  }

  @override
  Future<void> deleteUser(String userId) async {
    final userRef = firestore.collection("users").doc(userId);
    final userAuthRef = auth.currentUser;

    print('id: $userId');
    userRef.delete().then((doc) => print('User doc has been deleting'),
        onError: (e) => print("Error delete User $e"));
    userAuthRef?.delete().then((doc) => print('User auth has been deleting'),
        onError: (e) => print("Error delete auth User $e"));
  }

  @override
  Stream<List<TextMessageEntity>> getMessages(String channelId) {
    final oneToOneChatChannelRef = firestore.collection("groupChatChannel");
    final messagesRef =
        oneToOneChatChannelRef.doc(channelId).collection("messages");

    return messagesRef.orderBy('time').snapshots().map((querySnap) => querySnap
        .docs
        .map((queryDoc) => TextMessageModel.fromSnapshot(queryDoc))
        .toList());
  }
  // CHATS

  // GROUPS
  @override
  Future<void> getCreateGroup(GroupEntity groupEntity) async {
    final groupCollection = firestore.collection("groups");

    final groupId = groupCollection.doc().id;

    groupCollection.doc(groupId).get().then((groupDoc) {
      final newGroup = GroupModel(
        groupId: groupId,
        limitUsers: groupEntity.limitUsers,
        joinUsers: groupEntity.joinUsers,
        groupProfileImage: groupEntity.groupProfileImage,
        creationTime: groupEntity.creationTime,
        groupName: groupEntity.groupName,
        lastMessage: groupEntity.lastMessage,
      ).toDocument();

      if (!groupDoc.exists) {
        groupCollection.doc(groupId).set(newGroup);
        return;
      }
      return;
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Stream<List<GroupEntity>> getGroups() {
    final groupCollection = firestore.collection("groups");
    return groupCollection
        .orderBy("creationTime", descending: true)
        .snapshots()
        .map((querySnapshot) =>
            querySnapshot.docs.map((e) => GroupModel.fromSnapshot(e)).toList());
  }

  @override
  Future<void> joinGroup(GroupEntity groupEntity) async {
    final groupChatChannelCollection = firestore.collection("groupChatChannel");

    groupChatChannelCollection
        .doc(groupEntity.groupId)
        .get()
        .then((groupChannel) {
      Map<String, dynamic> groupMap = {"groupChannelId": groupEntity.groupId};
      if (!groupChannel.exists) {
        groupChatChannelCollection.doc(groupEntity.groupId).set(groupMap);
        return;
      }
      return;
    });
  }

  @override
  Future<void> updateGroup(GroupEntity groupEntity) async {
    Map<String, dynamic> groupInformation = {};

    final userCollection = firestore.collection("groups");

    if (groupEntity.groupProfileImage != "") {
      groupInformation['groupProfileImage'] = groupEntity.groupProfileImage;
    }
    if (groupEntity.groupName != "") {
      groupInformation["groupName"] = groupEntity.groupName;
    }
    if (groupEntity.lastMessage != "") {
      groupInformation["lastMessage"] = groupEntity.lastMessage;
    }
    if (groupEntity.creationTime != null) {
      groupInformation["creationTime"] = groupEntity.creationTime;
    }

    userCollection.doc(groupEntity.groupId).update(groupInformation);
  }

  @override
  Future<void> updateDataFirestore(String collectionPath, String docPath,
      Map<String, dynamic> dataNeedUpdate) {
    return firestore
        .collection(collectionPath)
        .doc(docPath)
        .update(dataNeedUpdate);
  }

  @override
  Future<void> joinChatMessage(String groupChatId) async {
    final chatCollection = firestore.collection("groupChatChannel");

    chatCollection.doc(groupChatId).get().then((groupChannel) {
      Map<String, dynamic> groupMap = {"groupChatChannel": groupChatId};
      if (!groupChannel.exists) {
        chatCollection.doc(groupChatId).set(groupMap);
        return;
      }
      return;
    });
  }
  // GROUPS
}
