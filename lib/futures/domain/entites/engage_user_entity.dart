import 'package:equatable/equatable.dart';

class EngageUserEntity extends Equatable {
  final String? uid;
  final String? otherUid;

  const EngageUserEntity({this.uid, this.otherUid});

  @override
  List<Object?> get props => [uid, otherUid];
}
