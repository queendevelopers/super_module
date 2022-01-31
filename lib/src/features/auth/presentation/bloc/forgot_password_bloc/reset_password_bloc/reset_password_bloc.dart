import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_module/src/features/auth/data/models/forgot_password_pin_verification_response_model.dart';
import 'package:super_module/src/features/auth/domain/controller/auth_login_controller.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

@injectable
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final IAuthLoginController controller;

  ResetPasswordBloc(this.controller) : super(ResetPasswordInitial());

  @override
  Stream<ResetPasswordState> mapEventToState(
    ResetPasswordEvent event,
  ) async* {
    if (event is ResetPasswordButtonTapEvent) {
      yield ResetPasswordLoading();
      final response =
          await controller.resetPasswordByPhone(phone: event.phone);
      if (response.ok) {
        yield ResetPasswordLoadSuccess(response);
        return;
      }
      yield ResetPasswordLoadFailure(errorMessage: response.message);
    }
  }
}
