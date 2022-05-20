part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatSubscribeEvent extends ChatState {}

class ChatTypingEvent extends ChatState {}

class ChatTypingCompleteEvent extends ChatState {}

class ChatMessageEvent extends ChatState {
  final dynamic message;

  ChatMessageEvent(this.message);
}

class ChatUnsubscribeEvent extends ChatState {}
