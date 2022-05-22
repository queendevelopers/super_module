import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:super_module/src/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:super_module/src/features/user/data/session/i_session_manager.dart';

@Injectable(as: IChatRepository)
class ChatRepository implements IChatRepository {
  final ISessionManager sessionManager;

  ChatRepository(this.sessionManager);

  @override
  Future<void> subscribe() async {
    final token = await sessionManager.getToken();
    Socket socket = io('https://stem.goswivt.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'auth': {
        'token': 'Bearer $token',
      },
    });
    socket.connect();
    socket.emit("addUser");
    socket.on("getUsersOnline", (user) => {print(user)});
    socket.onConnectError((data) => print('@@@@@@$data'));
    socket.onConnecting((data) => print(data));
    socket.onConnect((data) {
      print('connect');
      socket.emit('msg', 'test');
    });
    socket.onDisconnect((_) => print('disconnect'));
    socket.on('fromServer', (data) => print(data));
  }
}
