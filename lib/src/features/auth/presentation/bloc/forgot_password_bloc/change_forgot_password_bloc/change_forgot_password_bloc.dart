import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_module/src/features/auth/domain/controller/auth_login_controller.dart';
import 'package:super_module/src/features/user/data/session/i_session_manager.dart';

part 'change_forgot_password_event.dart';
part 'change_forgot_password_state.dart';

@injectable
class ChangeForgotPasswordBloc
    extends Bloc<ChangeForgotPasswordEvent, ChangeForgotPasswordState> {
  IAuthLoginController controller;
  ISessionManager sessionManager;

  ChangeForgotPasswordBloc(this.controller, this.sessionManager)
      : super(ChangeForgotPasswordInitial());

  @override
  Stream<ChangeForgotPasswordState> mapEventToState(
    ChangeForgotPasswordEvent event,
  ) async* {
    if (event is ChangeForgotPasswordButtonTapEvent) {
      yield ChangeForgotPasswordLoading();
      final data = await controller.changeForgotPassword(
          oldPassword: event.oldPassword,
          newPassword: event.newPassword,
          token: event.token);
      if (data.ok) {
        await sessionManager.clearSession();
        yield ChangeForgotPasswordLoadSuccess(message: data.message);
      } else {
        yield ChangeForgotPasswordLoadFailure(
            errorMessage: data.message ?? 'An unknown error occurred.');
      }
    }
  }
}
