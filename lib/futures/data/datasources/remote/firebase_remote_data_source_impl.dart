// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_social_app/futures/data/datasources/remote/firebase_remote_data_source.dart';
import 'package:flutter_social_app/futures/data/model/chat_messages_model.dart';
import 'package:flutter_social_app/futures/data/model/chat_model.dart';
import 'package:flutter_social_app/futures/data/model/group_model.dart';
import 'package:flutter_social_app/futures/data/model/text_message_model.dart';
import 'package:flutter_social_app/futures/data/model/user_model.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  String _verificationId = "";

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
      userInformation['profileUrl'] = user.photoUrl;
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
  Future<void> signInWithPhoneNumber(String pinCode) async {
    final AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: pinCode);
    await auth.signInWithCredential(authCredential);
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    // ignore: prefer_function_declarations_over_variables
    final PhoneVerificationCompleted phoneVerificationCompleted =
        (AuthCredential authCredential) {
      print("phone is verified : token ${authCredential.token}");
    };

    // ignore: prefer_function_declarations_over_variables
    final PhoneVerificationFailed phoneVerificationFailed =
        (FirebaseAuthException authCredential) {
      print("phone failed ${authCredential.message},${authCredential.code}");
    };

    // ignore: prefer_function_declarations_over_variables
    final PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
      print("time out $verificationId");
    };

    // ignore: prefer_function_declarations_over_variables
    final PhoneCodeSent phoneCodeSent =
        (String verificationID, [int? forceResendingToken]) {
      _verificationId = verificationID;
      print("sendPhoneCode $verificationID");
    };

    auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
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

  @override
  Future<String> getChannelId(EngageUserEntity engageUserEntity) {
    final userCollectionRef = firestore.collection("users");
    print(
        "uid ${engageUserEntity.uid} - otherUid ${engageUserEntity.otherUid}");
    return userCollectionRef
        .doc(engageUserEntity.uid)
        .collection('chatChannel')
        .doc(engageUserEntity.otherUid)
        .get()
        .then((chatChannelId) {
      if (chatChannelId.exists) {
        return chatChannelId.get('channelId');
      } else {
        // ignore: null_argument_to_non_null_type
        return Future.value(null);
      }
    });
  }

  @override
  Stream<List<UserEntity>> getAllUsers() {
    final userCollection = firestore.collection("users");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Future<String> createOneToOneChatChannel(
      EngageUserEntity engageUserEntity) async {
    final userCollectionRef = firestore.collection("users");

    final oneToOneChatChannelRef = firestore.collection("OneToOneChatChannel");

    userCollectionRef
        .doc(engageUserEntity.uid)
        .collection("chatCollection")
        .doc(engageUserEntity.otherUid)
        .get()
        .then((chatChannelDoc) {
      if (chatChannelDoc.exists) {
        return chatChannelDoc.get('channelId');
      }

      final chatChannelId = oneToOneChatChannelRef.doc().id;

      var channel = {'channelId': chatChannelId};

      oneToOneChatChannelRef.doc(chatChannelId).set(channel);

      // currentUser
      userCollectionRef
          .doc(engageUserEntity.uid)
          .collection("chatCollection")
          .doc(engageUserEntity.otherUid)
          .set(channel);

      // otherUser
      userCollectionRef
          .doc(engageUserEntity.uid)
          .collection("chatCollection")
          .doc(engageUserEntity.otherUid)
          .set(channel);

      return chatChannelId;
    });
    return Future.value("");
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
    ).toDocument();

    messagesRef.doc(messageId).set(newMessage);
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

  @override
  Future<void> addToMyChat(ChatEntity myChatEntity) async {
    final myChatRef = firestore
        .collection("users")
        .doc(myChatEntity.senderUid)
        .collection("myChat");
    final otherChatRef = firestore
        .collection("users")
        .doc(myChatEntity.recipientUid)
        .collection("myChat");

    final myNewChatCurrentUser = ChatModel(
      channelId: myChatEntity.channelId,
      senderName: myChatEntity.senderName,
      time: myChatEntity.time,
      recipientName: myChatEntity.recipientName,
      recipientPhoneNumber: myChatEntity.recipientPhoneNumber,
      recipientUid: myChatEntity.recipientUid,
      senderPhoneNumber: myChatEntity.senderPhoneNumber,
      senderUid: myChatEntity.senderUid,
      profileUrl: myChatEntity.profileUrl,
      isArchived: myChatEntity.isArchived,
      isRead: myChatEntity.isRead,
      recentTextMessage: myChatEntity.recentTextMessage,
      subjectName: myChatEntity.subjectName,
    ).toDocument();
    final myNewChatOtherUser = ChatModel(
      channelId: myChatEntity.channelId,
      senderName: myChatEntity.recipientName,
      time: myChatEntity.time,
      recipientName: myChatEntity.senderName,
      recipientPhoneNumber: myChatEntity.senderPhoneNumber,
      recipientUid: myChatEntity.senderUid,
      senderPhoneNumber: myChatEntity.recipientPhoneNumber,
      senderUid: myChatEntity.recipientUid,
      profileUrl: myChatEntity.profileUrl,
      isArchived: myChatEntity.isArchived,
      isRead: myChatEntity.isRead,
      recentTextMessage: myChatEntity.recentTextMessage,
      subjectName: myChatEntity.subjectName,
    ).toDocument();
    myChatRef.doc(myChatEntity.recipientUid).get().then((myChatDoc) {
      if (!myChatDoc.exists) {
        myChatRef.doc(myChatEntity.recipientUid).set(myNewChatCurrentUser);
        otherChatRef.doc(myChatEntity.senderUid).set(myNewChatOtherUser);
        return;
      } else {
        print("update");
        myChatRef.doc(myChatEntity.recipientUid).update(myNewChatCurrentUser);
        otherChatRef.doc(myChatEntity.senderUid).set(myNewChatOtherUser);

        return;
      }
    });
  }

  @override
  Stream<List<ChatEntity>> getMyChat(String uid) {
    final myChatRef =
        firestore.collection("users").doc(uid).collection("myChat");

    return myChatRef.orderBy('time', descending: true).snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map((queryDocumentSnapshot) {
          return ChatModel.fromSnapshot(queryDocumentSnapshot);
        }).toList();
      },
    );
  }

  // GROUPS
  @override
  Future<void> createNewGroup(
      ChatEntity chatEntity, List<String> selectUserList) async {
    await _createGroup(chatEntity, selectUserList);
    return;
  }

  _createGroup(ChatEntity chatEntity, List<String> selectUserList) async {
    final myNewChatCurrentUser = ChatModel(
      channelId: chatEntity.channelId,
      senderName: chatEntity.senderName,
      time: chatEntity.time,
      recipientName: chatEntity.recipientName,
      recipientPhoneNumber: chatEntity.recipientPhoneNumber,
      recipientUid: chatEntity.recipientUid,
      senderPhoneNumber: chatEntity.senderPhoneNumber,
      senderUid: chatEntity.senderUid,
      profileUrl: chatEntity.profileUrl,
      isArchived: chatEntity.isArchived,
      isRead: chatEntity.isRead,
      recentTextMessage: chatEntity.recentTextMessage,
      subjectName: chatEntity.subjectName,
    ).toDocument();
    print("sender Id ${chatEntity.senderUid}");
    await firestore
        .collection("users")
        .doc(chatEntity.senderUid)
        .collection("myChat")
        .doc(chatEntity.channelId)
        .set(myNewChatCurrentUser)
        .then((value) => print("data created"))
        .catchError((error) {
      print("dataError $error");
    });
  }

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

  // GROUPS
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
}
