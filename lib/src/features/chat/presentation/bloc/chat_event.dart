part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class CreateSocketConnectionEvent extends ChatEvent {}

class EmitAnyEvent extends ChatEvent {
  final String key;

  EmitAnyEvent({required this.key});
}

class EmitOnAnyEvent extends ChatEvent {
  final String key;
  final dynamic data;

  EmitOnAnyEvent({required this.key, this.data});
}

class SendMessageEvent extends ChatEvent {
  final String receiverId;
  final String message;

  SendMessageEvent({required this.receiverId, required this.message});
}

class GetOnlineUsersEvent extends ChatEvent {}

class GetMessageEvent extends ChatEvent {}

class GetMessageResponseEvent extends ChatEvent {}
