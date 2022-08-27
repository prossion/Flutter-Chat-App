import 'package:equatable/equatable.dart';
import 'package:flutter_social_app/futures/data/model/chat_messages_model.dart';

abstract class MyGroupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MyGroupInitialState extends MyGroupState {}

class MyGroupLoadingState extends MyGroupState {}

class MyGroupMessageLoadedState extends MyGroupState {
  final List<ChatMessagesModel> chatMessages;

  MyGroupMessageLoadedState({required this.chatMessages});
  @override
  List<Object?> get props => [chatMessages];
}

class MyGroupErrorState extends MyGroupState {}
