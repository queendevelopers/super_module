import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';
import 'package:super_module/src/features/chat/data/models/chat_message_response.dart';
import 'package:super_module/src/features/chat/data/models/send_message_request_model.dart';
import 'package:super_module/src/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:super_module/src/features/user/data/session/i_session_manager.dart';

abstract class IChatController {
  Future<Socket> createSocketConnection();

  Future<void> emitAny({required String key});

  Stream<dynamic> onAny({required String key, dynamic data});

  Future<void> sendMessage(
      {required String receiverId, required String message});

  Stream<ResponseEntityList<UserModel>> getOnlineUsers();

  Stream<ResponseEntity<ChatMessageResponse>> getMessage();

  Stream<ResponseEntity<ChatMessageResponse>> getMessageResponse();
}

class ChatController implements IChatController {
  final IChatRepository repository;
  final ISessionManager sessionManager;

  ChatController(this.repository, this.sessionManager);

  @override
  Future<Socket> createSocketConnection() async {
    return await repository.createSocketConnection();
  }

  @override
  Future<void> emitAny({required String key}) async {
    repository.emitAny(key: key);
  }

  @override
  Stream<ResponseEntity<ChatMessageResponse>> getMessage() async* {
    yield* repository.getMessage();
  }

  @override
  Stream<ResponseEntity<ChatMessageResponse>> getMessageResponse() async* {
    yield* repository.getMessageResponse();
  }

  @override
  Stream<ResponseEntityList<UserModel>> getOnlineUsers() async* {
    yield* repository.getOnlineUsers();
  }

  @override
  Stream onAny({required String key, data}) async* {
    yield* repository.onAny(key: key, data: data);
  }

  @override
  Future<void> sendMessage(
      {required String receiverId, required String message}) async {
    final user = await sessionManager.getCurrentUser();
    repository.sendMessage(
        requestModel:
            SendMessageRequestModel(user!, UserModel(id: receiverId), message));
  }
}
