import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/auth/data/models/biometric_register_model.dart';
import 'package:super_module/src/features/auth/data/models/biometric_register_response_model.dart';
import 'package:super_module/src/features/auth/data/models/encrypted_access_token_response_model.dart';
import 'package:super_module/src/features/auth/data/models/forgot_password_pin_verification_response_model.dart';
import 'package:super_module/src/features/auth/data/models/global_response_model.dart';
import 'package:super_module/src/features/auth/data/models/login_model.dart';
import 'package:super_module/src/features/auth/data/models/social/social_model.dart';
import 'package:super_module/src/features/auth/data/models/user_login_request_model.dart';
import 'package:super_module/src/features/auth/data/requests/auth_apple_request_endpoint.dart';
import 'package:super_module/src/features/auth/data/requests/auth_facebook_request_endpoint.dart';
import 'package:super_module/src/features/auth/data/requests/auth_google_request_endpoint.dart';
import 'package:super_module/src/features/auth/data/requests/auth_login_request_endpoint.dart';
import 'package:super_module/src/features/auth/data/requests/check_username_request_endpoint.dart';
import 'package:super_module/src/features/auth/data/requests/endpoints/auth_register_request_endpoint.dart';
import 'package:super_module/src/features/auth/data/requests/endpoints/auth_verification_phone_endpoint.dart';
import 'package:super_module/src/features/auth/data/requests/endpoints/auth_with_biometrics_endpoint.dart';
import 'package:super_module/src/features/auth/data/requests/endpoints/biometric_register_endpoint.dart';
import 'package:super_module/src/features/auth/data/requests/endpoints/change_forgot_password_request_endpoint.dart';
import 'package:super_module/src/features/auth/data/requests/endpoints/change_password_request_endpoint.dart';
import 'package:super_module/src/features/auth/data/requests/endpoints/reset_forgot_password_request_endpoint.dart';
import 'package:super_module/src/features/auth/data/requests/endpoints/verify_forgot_password_otp_request_endpoint.dart';
import 'package:super_module/src/features/auth/data/requests/endpoints/verify_otp_endpoint.dart';
import 'package:super_module/src/features/auth/data/requests/model/biometric_register_request_model.dart';
import 'package:super_module/src/features/auth/data/requests/model/check_username_request_model.dart';
import 'package:super_module/src/features/auth/data/requests/model/register_request_model.dart';
import 'package:super_module/src/features/auth/domain/repositories/i_auth_remote_repository.dart';
import 'package:super_module/src/features/user/data/requests/forgot_password_pin_verification_request_model.dart';
import 'package:super_module/src/features/user/data/session/i_session_manager.dart';

import '../requests/endpoints/reset_password_by_email_endpoint.dart';

@Injectable(as: IAuthRemoteRepository)
class AuthRemoteRepository implements IAuthRemoteRepository {
  final IHttpHelper httpHelper;
  final ISessionManager sessionManager;

  AuthRemoteRepository(this.httpHelper, this.sessionManager);

  @override
  Future<LoginModel> authLogin(UserLoginRequestModel requestModel) async {
    try {
      final response =
          await httpHelper.request(AuthLoginRequestEndPoint(), requestModel);
      debugPrint(response.toString());
      LoginModel model = LoginModel.fromJson(response);
      debugPrint('passed');
      return model;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<LoginModel> registerUser(
      RegisterRequestModel registerRequestModel) async {
    try {
      final response = await httpHelper.request(
          AuthRegisterRequestEndpoint(), registerRequestModel);
      debugPrint(response.toString());
      LoginModel model = LoginModel.fromJson(response);
      debugPrint(model.message);
      return model;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<ForgotPasswordPinVerificationResponseModel> resetPasswordByPhone(
      ForgotPasswordPinVerificationRequestModel
          forgotPasswordPinVerificationRequestModel) async {
    try {
      final response = await httpHelper.request(
          ResetForgotPasswordRequestEndPoint(),
          forgotPasswordPinVerificationRequestModel);
      debugPrint(response.toString());
      ForgotPasswordPinVerificationResponseModel model =
          ForgotPasswordPinVerificationResponseModel.fromJson(response);
      debugPrint(model.message);
      return model;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<ForgotPasswordPinVerificationResponseModel> verifyForgotPasswordOtp(
      ForgotPasswordPinVerificationRequestModel
          forgotPasswordPinVerificationRequestModel) async {
    try {
      final response = await httpHelper.request(
          VerifyForgotPasswordOtpRequestEndPoint(),
          forgotPasswordPinVerificationRequestModel);
      debugPrint(response.toString());
      ForgotPasswordPinVerificationResponseModel model =
          ForgotPasswordPinVerificationResponseModel.fromJson(response);
      debugPrint(model.message);
      return model;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<ForgotPasswordPinVerificationResponseModel> changeForgotPassword(
      ForgotPasswordPinVerificationRequestModel
          forgotPasswordPinVerificationRequestModel) async {
    try {
      final response = await httpHelper.request(
          forgotPasswordPinVerificationRequestModel.password!=null
              ? ChangePasswordRequestEndPoint()
              : ChangeForgotPasswordRequestEndPoint(),
          forgotPasswordPinVerificationRequestModel);
      debugPrint(response.toString());
      ForgotPasswordPinVerificationResponseModel model =
          ForgotPasswordPinVerificationResponseModel.fromJson(response);
      debugPrint(model.message);
      return model;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<SocialModel> loginWithFacebook({required String token}) async {
    try {
      final response = await httpHelper.request(
          AuthFacebookRequestEndpoint(token), BaseRequestModel());
      return SocialModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GlobalResponseModel> getOtp({String? token}) async {
    try {
      final response = await httpHelper.request(
          AuthVerificationPhoneEndpoint(), BaseRequestModel(), headers: {
        'Authorization': 'Bearer ${token ?? await sessionManager.getToken()}'
      });
      return GlobalResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GlobalResponseModel> verifyOtp(int otpCode) async {
    try {
      final response = await httpHelper.request(
          VerifyOtpEndpoint(otpCode), BaseRequestModel(), headers: {
        'Authorization': 'Bearer ${await sessionManager.getToken()}'
      });
      return GlobalResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SocialModel> loginWithGoogle({String? token}) async {
    try {
      final response = await httpHelper.request(
          AuthGoogleRequestEndpoint(token!), BaseRequestModel());
      return SocialModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GlobalResponseModel> checkUsername(
      {CheckUsernameRequestModel? model}) async {
    try {
      final response =
          await httpHelper.request(CheckUsernameRequestEndpoint(), model!);
      return GlobalResponseModel.fromJson(response);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<BiometricRegisterResponseModel> registerBiometric(
      BiometricRegisterRequestModel model) async {
    try {
      final response =
          await httpHelper.request(BiometricRegisterEndpoint(), model);
      debugPrint(response.toString());
      return BiometricRegisterResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<EncryptedAccessTokenResponseModel> authenticateWithBiometrics(
      BiometricRegisterModel model) async {
    try {
      final response =
          await httpHelper.request(AuthWithBiometicsEndpoint(), model);
      return EncryptedAccessTokenResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SocialModel> loginWithApple({String? token}) async {
    try {
      final response = await httpHelper.request(
          AuthAppleRequestEndpoint(token!), BaseRequestModel());
      return SocialModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ForgotPasswordPinVerificationResponseModel> resetPasswordByEmail(
      ForgotPasswordPinVerificationRequestModel
          forgotPasswordPinVerificationRequestModel) async {
    try {
      final response = await httpHelper.request(
          ResetPasswordByEmailRequestEndPoint(),
          forgotPasswordPinVerificationRequestModel);
      debugPrint(response.toString());
      ForgotPasswordPinVerificationResponseModel model =
          ForgotPasswordPinVerificationResponseModel.fromJson(response);
      debugPrint(model.message);
      return model;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
