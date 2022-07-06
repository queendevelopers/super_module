import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:super_module/src/features/chat/domain/controller/chat_controller.dart';

part 'chat_event.dart';
part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final IChatController chatController;

  ChatBloc(this.chatController) : super(ChatInitial()) {
    on<ChatEvent>((event, emit) async* {
      if (event is CreateSocketConnectionEvent) {
        final socket = await chatController.createSocketConnection(
            socketUrl: event.socketUrl);
        emit(ChatSubscribeSuccessState(socket));
      } else if (event is EmitAnyEvent) {
        chatController.emitAny(key: event.key);
      } else if (event is EmitOnAnyEvent) {
        yield* (chatController.onAny(key: event.key, data: event.data));
      } else if (event is SendMessageEvent) {
        chatController.sendMessage(
            receiverId: event.receiverId, message: event.message);
      } else if (event is GetOnlineUsersEvent) {
        yield* (chatController.getOnlineUsers());
      } else if (event is GetMessageEvent) {
        yield* (chatController.getMessage());
      } else if (event is GetMessageResponseEvent) {
        yield* (chatController.getMessageResponse());
      }
    });
  }
}
