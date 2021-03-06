import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_module/src/auth/data/models/login_model.dart';
import 'package:super_module/src/auth/domain/controller/auth_login_controller.dart';
import 'package:super_module/src/user/data/session/i_session_manager.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IAuthLoginController controller;
  final ISessionManager sessionManager;

  LoginBloc(this.controller, this.sessionManager) : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonTapEvent) {
      yield LoginLoadingState();
      try {
        final response = await controller.authLogin(
            email: event.email, password: event.password);
        if (response.ok) {
          final localUser = await sessionManager.getCurrentUser();
          if (response.user.id != localUser.id) {
            await sessionManager.clearBiometrics();
          }
          yield LoginSuccessState(response);
          return;
        }
        yield LoginFailureState(errorMessage: response.message);
      } catch (e) {
        yield LoginFailureState(errorMessage: e.toString());
      }
    } else if (event is LoginWithFaceBookTapEvent) {
      final response = controller.loginWithFacebook();
    }
  }
}
