import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
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
        final socket = await chatController.createSocketConnection();
        yield ChatSubscribeSuccessState(socket);
      }
    });
  }
}
