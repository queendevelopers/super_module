import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';
import 'package:super_module/src/features/chat/data/models/chat_message_response.dart';
import 'package:super_module/src/features/chat/data/models/send_message_request_model.dart';
import 'package:super_module/src/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:super_module/src/features/user/data/session/i_session_manager.dart';

@Injectable(as: IChatRepository)
class ChatRepository implements IChatRepository {
  late Socket socket;
  final ISessionManager sessionManager;

  ChatRepository(this.sessionManager);

  @override
  Future<Socket> createSocketConnection({required String socketUrl}) async {
    // final String? token =
    //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyNzU1MmU0Y2I0OTJhMzg3OGZhOTcxYSIsImlhdCI6MTY1MzI5MjE3OCwiZXhwIjoxNjUzMzc4NTc4LCJpc3MiOiJpc3N1ZXJfbmFtZSJ9.J8pxztluo1C5UpcCgqnT9BnUEZr9Os3b0SnjdCcwexU';
    socket = io(socketUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'auth': {
        'token': 'Bearer ${await sessionManager.getToken()}',
      },
    });
    socket.connect();
    socket.onConnect((data) {
      print('Successfully connected to socket!!');
    });
    socket.onConnectError((data) => print('Socket: $data'));
    socket.onConnecting((data) => print('Socket: $data'));
    socket.onDisconnect((data) => print('Socket: $data'));
    socket.onAny((event, data) =>
        print('Socket ${event.toString()} ${data.toString()}'));
    socket.emit("addUser");
    // socket.on("getUsersOnline", (user) => {print(user)});
    socket.on('fromServer', (data) => print(data));
    return socket;
  }

  @override
  Future<void> emitAny({required String key, dynamic data}) async {
    socket.emit(key, data);
  }

  @override
  Stream<dynamic> onAny({required String key, dynamic data}) async* {
    socket.on(key, (response) async* {
      try {
        yield response;
      } catch (e) {
        rethrow;
      }
    });
  }

  @override
  Future<void> sendMessage(
      {required SendMessageRequestModel requestModel}) async {
    socket.emit(
      'sendMessage',
      requestModel.toJson(),
    );
  }

  @override
  Stream<ResponseEntity<ChatMessageResponse>> getMessage() async* {
    socket.on('getMessage', (response) async* {
      try {
        yield ResponseEntity<ChatMessageResponse>.fromJson(
            json: response,
            jsonObj: (data) => ChatMessageResponse.fromJson(data));
      } catch (e) {
        rethrow;
      }
    });
  }

  @override
  Stream<ResponseEntity<ChatMessageResponse>> getMessageResponse() async* {
    socket.on('messageResponse', (response) async* {
      try {
        yield (ResponseEntity<ChatMessageResponse>.fromJson(
            json: response,
            jsonObj: (data) => ChatMessageResponse.fromJson(data)));
      } catch (e) {
        rethrow;
      }
    });
  }

  @override
  Stream<ResponseEntityList<UserModel>> getOnlineUsers() async* {
    socket.on('getUsersOnline', (response) async* {
      try {
        print(response.toString());
        yield ResponseEntityList<UserModel>.fromJson(
            json: response, fromJson: (data) => UserModel.fromJson(data));
      } catch (e) {
        rethrow;
      }
    });
  }
}
