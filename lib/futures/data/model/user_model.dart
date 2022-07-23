import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_social_app/futures/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    String name = "user",
    String email = "",
    String phoneNumber = "",
    bool isOnline = false,
    String uid = "",
    String status = "",
    String photoUrl = "",
  }) : super(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          isOnline: isOnline,
          uid: uid,
          status: status,
          photoUrl: photoUrl,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNubmer'],
      isOnline: json['isOnline'],
      uid: json['uid'],
      status: json['status'],
      photoUrl: json['photoUrl'],
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      name: snapshot.data().toString().contains('name')
          ? snapshot.get('name')
          : '',
      email: snapshot.data().toString().contains('email')
          ? snapshot.get('email')
          : '',
      phoneNumber: snapshot.data().toString().contains('phoneNumber')
          ? snapshot.get('phoneNumber')
          : '',
      isOnline: snapshot.data().toString().contains('isOnline')
          ? snapshot.get('isOnline')
          : false,
      uid:
          snapshot.data().toString().contains('uid') ? snapshot.get('uid') : '',
      status: snapshot.data().toString().contains('status')
          ? snapshot.get('status')
          : '',
      photoUrl: snapshot.data().toString().contains('photoUrl')
          ? snapshot.get('photoUrl')
          : '',
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "isOnline": isOnline,
      "uid": uid,
      "status": status,
      "photoUrl": photoUrl,
    };
  }
}
