import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/auth/data/models/forgot_password_pin_verification_response_model.dart';
import 'package:super_module/src/auth/data/models/global_response_model.dart';
import 'package:super_module/src/auth/data/models/login_model.dart';
import 'package:super_module/src/auth/data/models/social/social_model.dart';
import 'package:super_module/src/auth/data/models/user_login_request_model.dart';
import 'package:super_module/src/auth/data/requests/model/check_username_request_model.dart';
import 'package:super_module/src/auth/data/requests/model/register_request_model.dart';
import 'package:super_module/src/auth/domain/repositories/i_auth_remote_repository.dart';
import 'package:super_module/src/user/data/requests/forgot_password_pin_verification_request_model.dart';
import 'package:super_module/src/user/data/session/i_session_manager.dart';

abstract class IAuthLoginController {
  Future<LoginModel> authLogin(
      {required String email, required String password});

  Future<LoginModel> registerUser(
      { String? username,
      required String name,
      required String email,
      required String phone,
      String address,
      required String password});

  Future<ForgotPasswordPinVerificationResponseModel> resetPasswordByPhone({
    required String phone,
  });

  Future<ForgotPasswordPinVerificationResponseModel> verifyForgotPasswordOtp(
      {required int otpCode,
      required bool navigateToHome,
      required String key});

  Future<ForgotPasswordPinVerificationResponseModel> changeForgotPassword(
      {required String oldPassword,
      required String newPassword,
      required String token});

  Future<SocialModel> loginWithFacebook();

  Future<GlobalResponseModel> getOtp({String token});

  Future<GlobalResponseModel> verifyOtp({required int otpCode});

  Future<GlobalResponseModel> checkUsername({String username});
}

@Injectable(as: IAuthLoginController)
class AuthLoginController implements IAuthLoginController {
  IAuthRemoteRepository iAuthRemoteRepository;
  ISessionManager iSessionManager;

  AuthLoginController(this.iAuthRemoteRepository, this.iSessionManager);

  @override
  Future<LoginModel> authLogin(
      {required String email, required String password}) async {
    final model = UserLoginRequestModel(email: email, password: password);
    //change string of data into model
    final data = await iAuthRemoteRepository.authLogin(model);
    if (data.ok) {
      debugPrint('saved token to local storage');
      iSessionManager.saveToken(accessToken: data.accessToken!);
      iSessionManager.saveCurrentUser(user: data.user);
    }
    return data;
  }

  @override
  Future<LoginModel> registerUser(
      {String? username,
      required String name,
      required String email,
      required String phone,
      String? address,
      required String password}) async {
    final model = RegisterRequestModel(
        name: name,
        email: email,
        phone: phone,
        password: password,
        username: username);
    final data = await iAuthRemoteRepository.registerUser(model);
    return data;
  }

  @override
  Future<ForgotPasswordPinVerificationResponseModel> resetPasswordByPhone(
      {required String phone}) async {
    final model = ForgotPasswordPinVerificationRequestModel(phone: phone);
    final data = await iAuthRemoteRepository.resetPasswordByPhone(model);
    return data;
  }

  @override
  Future<ForgotPasswordPinVerificationResponseModel> verifyForgotPasswordOtp(
      {int? otpCode, bool navigateToHome = false, String? key}) async {
    final model =
        ForgotPasswordPinVerificationRequestModel(code: otpCode, key: key);
    final data = await iAuthRemoteRepository.verifyForgotPasswordOtp(model);
    return data;
  }

  @override
  Future<ForgotPasswordPinVerificationResponseModel> changeForgotPassword(
      {String? newPassword, String? oldPassword, String? token}) async {
    final model = ForgotPasswordPinVerificationRequestModel(
        password: oldPassword, newPassword: newPassword, token: token);
    final data = await iAuthRemoteRepository.changeForgotPassword(model);
    return data;
  }

  @override
  Future<SocialModel> loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile

    // if (result.status == LoginStatus.success) {
    //   // facebookSignIn.logOut();
    //   debugPrint('loggout from facebook');
    // }
    // final FacebookLoginResult result = await facebookSignIn.logIn([
    //   'email',
    // ]);

    // facebookSignIn.loginBehavior = FacebookLoginBehavior.nativeWithFallback;
    switch (result.status) {
      case LoginStatus.success:
        final AccessToken? accessToken = result.accessToken;

        // final FacebookAccessToken accessToken = result.accessToken;
        SocialModel model = await iAuthRemoteRepository.loginWithFacebook(
            token: accessToken!.token);
        debugPrint(accessToken.expires.toString());
        return model;
      case LoginStatus.failed:
        return SocialModel(ok: false, message: result.message!);

      default:
        return SocialModel(ok: false, message: result.message!);
    }
  }

  @override
  Future<GlobalResponseModel> getOtp({String? token}) async {
    final data = await iAuthRemoteRepository.getOtp(token: token!);
    return data;
  }

  @override
  Future<GlobalResponseModel> verifyOtp({int? otpCode}) async {
    final data = await iAuthRemoteRepository.verifyOtp(otpCode!);
    return data;
  }

  @override
  Future<GlobalResponseModel> checkUsername({String? username}) async {
    final response = await iAuthRemoteRepository.checkUsername(
        model: CheckUsernameRequestModel(username!));
    return response;
  }
}
