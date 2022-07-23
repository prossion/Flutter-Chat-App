import 'package:equatable/equatable.dart';
import 'package:flutter_social_app/futures/domain/entites/entites.dart';

abstract class ChatState extends Equatable {
  const ChatState();
}

class ChatInitialState extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatLoadingState extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatLoadedState extends ChatState {
  final List<TextMessageEntity> messages;

  const ChatLoadedState({required this.messages});
  @override
  List<Object?> get props => [messages];
}

class ChatErrorState extends ChatState {
  @override
  List<Object?> get props => [];
}
