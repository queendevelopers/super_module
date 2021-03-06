import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_module/src/auth/data/models/global_response_model.dart';
import 'package:super_module/src/auth/data/models/login_model.dart';
import 'package:super_module/src/auth/domain/controller/auth_login_controller.dart';
import 'package:super_module/src/user/data/session/i_session_manager.dart';

part 'register_event.dart';
part 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IAuthLoginController controller;
  final ISessionManager sessionManager;

  RegisterBloc(this.controller, this.sessionManager)
      : super(RegisterInitialState());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterButtonTapEvent) {
      yield RegisterLoadingState();
      final response = await controller.registerUser(
          username: event.username,
          name: event.fullName,
          email: event.email,
          password: event.password,
          phone: event.phone);
      if (response.ok) {
        if (response.user != null) {
          await sessionManager.saveCurrentUser(user: response.user);
          await sessionManager.saveToken(accessToken: response.accessToken);
        }
        yield RegisterSuccessState(response);
        return;
      }
      yield RegisterFailureState(errorMessage: response.message);
    } else if (event is CheckUserNameAvailability) {
      yield UsernameCheckingState();
      final response = await controller.checkUsername(username: event.username);
      if (response.ok) {
        yield UsernameCheckSuccessState(response);
        return;
      }
      yield UsernameCheckFailureState(response);
    }
  }
}
