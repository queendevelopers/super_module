import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';
import 'package:super_module/src/features/chat/data/models/chat_message_response.dart';
import 'package:super_module/src/features/chat/data/models/send_message_request_model.dart';

abstract class IChatRepository {
  Future<Socket> createSocketConnection();

  Future<void> emitAny({required String key});

  Stream<dynamic> onAny({required String key, dynamic data});

  Future<void> sendMessage({required SendMessageRequestModel requestModel});

  Stream<ResponseEntityList<UserModel>> getOnlineUsers();

  Stream<ResponseEntity<ChatMessageResponse>> getMessage();

  Stream<ResponseEntity<ChatMessageResponse>> getMessageResponse();
}
