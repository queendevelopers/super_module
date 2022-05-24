part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatSubscribeSuccessState extends ChatState {
  final Socket socket;

  ChatSubscribeSuccessState(this.socket);
}

class ChatSubscribeFailureState extends ChatState {}
