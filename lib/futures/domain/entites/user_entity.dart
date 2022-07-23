import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final bool isOnline;
  final String uid;
  final String status;
  final String photoUrl;
  final String password;

  const UserEntity({
    this.name = "",
    this.email = "",
    this.phoneNumber = "",
    this.isOnline = false,
    this.uid = "",
    this.status = "Hello!",
    this.photoUrl = "",
    this.password = "",
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phoneNumber,
        isOnline,
        uid,
        status,
        photoUrl,
        password,
      ];
}
