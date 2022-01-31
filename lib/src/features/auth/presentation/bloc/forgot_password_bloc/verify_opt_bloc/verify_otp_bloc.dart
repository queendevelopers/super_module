import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/auth/data/models/forgot_password_pin_verification_response_model.dart';
import 'package:super_module/src/features/auth/data/models/global_response_model.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';
import 'package:super_module/src/features/auth/domain/controller/auth_login_controller.dart';
import 'package:super_module/src/features/user/data/session/i_session_manager.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

@injectable
class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final IAuthLoginController controller;
  final ISessionManager sessionManager;
  late GlobalResponseModel response;
  ForgotPasswordPinVerificationResponseModel? forgotPasswordRequestModel;

  VerifyOtpBloc(this.controller, this.sessionManager)
      : super(VerifyOtpInitial());

  @override
  Stream<VerifyOtpState> mapEventToState(
    VerifyOtpEvent event,
  ) async* {
    debugPrint(state.toString());
    if (event is VerifyOtpButtonTapEvent) {
      yield VerifyOtpLoading();
      if (event.navigateToHome) {
        response = await controller.verifyOtp(otpCode: event.otpCode);
        if (response.ok!) {
          final UserModel? user = await sessionManager.getCurrentUser();
          if (user != null) {
            debugPrint(response.user.toString());
            await sessionManager.saveCurrentUser(user: response.user);
          }
          yield VerifyOtpSuccess(message: response.message!);
          debugPrint('otp success without token');
        } else {
          yield VerifyOtpLoadFailure(errorMessage: response.message!);
        }
      } else {
        forgotPasswordRequestModel = await controller.verifyForgotPasswordOtp(
            otpCode: event.otpCode,
            navigateToHome: event.navigateToHome,
            key: event.key);
        debugPrint('response from token ${forgotPasswordRequestModel?.token}');
        if (forgotPasswordRequestModel!.ok) {
          final UserModel? user = await sessionManager.getCurrentUser();
          if (user != null) {
            user.phoneVerified = true;
            await sessionManager.saveCurrentUser(user: user);
          }
          yield VerifyOtpSuccess(
              message: forgotPasswordRequestModel!.message!,
              token: forgotPasswordRequestModel!.token!);
          debugPrint(
              'otp success with token ${forgotPasswordRequestModel!.token}');
        } else {
          yield VerifyOtpLoadFailure(
              errorMessage: forgotPasswordRequestModel!.message);
        }
      }
    } else if (event is GetOtpEvent) {
      yield GetOtpSending();
      final response = await controller.getOtp(token: event.token!);
      if (response.ok!) {
        yield GetOtpSuccess(response.message);
      } else {
        yield GetOtpFailure(response.message);
      }
    }
  }
}

/*@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IAuthLoginController controller;

  RegisterBloc(this.controller) : super(RegisterInitialState());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterButtonTapEvent) {
      yield RegisterLoadingState();
      final response = await controller.registerUser(
          name: event.fullName,
          email: event.email,
          password: event.password,
          phone: event.phone);
      if (response.ok) {
        yield RegisterSuccessState();
        return;
      }
      yield RegisterFailureState(errorMessage: response.message);
    }
  }
}*/
