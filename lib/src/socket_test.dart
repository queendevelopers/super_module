import 'package:socket_io_client/socket_io_client.dart';

void main() {
  var token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyOGIyMTlkYWFiMDUxNDc0MDdlNzkxOSIsImlhdCI6MTY1Mzk4OTAzNywiZXhwIjoxNjU0MDc1NDM3LCJpc3MiOiJpc3N1ZXJfbmFtZSJ9.MRkGK32LJoUtqSOYmY-snWNBxVG_-uXYLXkIdBIUc3M';

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
    socket.emit('sendMessage', {
      "sender": {"_id": "628b219daab05147407e7919"},
      "receiver": {"_id": "627552e4cb492a3878fa971a"},
      "msg": "12345678",
    });
  });
  socket.onDisconnect((_) => print('disconnect'));
  socket.on('fromServer', (data) => print(data));
  socket.on('messageResponse', (data) => print(data));
  socket.on('getMessage', (data) => print(data));
}
