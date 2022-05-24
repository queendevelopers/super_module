import 'package:socket_io_client/socket_io_client.dart';

void main() {
  var token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyNzU1MmU0Y2I0OTJhMzg3OGZhOTcxYSIsImlhdCI6MTY1MzAyOTI0NywiZXhwIjoxNjUzMTE1NjQ3LCJpc3MiOiJpc3N1ZXJfbmFtZSJ9.VHPCJ4ky4S7HY87JjNA26ka2ifxkB25aeFOJs8Amtug';

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
