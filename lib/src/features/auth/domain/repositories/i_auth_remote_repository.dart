import 'package:super_module/src/features/auth/data/models/biometric_register_model.dart';
import 'package:super_module/src/features/auth/data/models/biometric_register_response_model.dart';
import 'package:super_module/src/features/auth/data/models/encrypted_access_token_response_model.dart';
import 'package:super_module/src/features/auth/data/models/forgot_password_pin_verification_response_model.dart';
import 'package:super_module/src/features/auth/data/models/global_response_model.dart';
import 'package:super_module/src/features/auth/data/models/login_model.dart';
import 'package:super_module/src/features/auth/data/models/social/social_model.dart';
import 'package:super_module/src/features/auth/data/models/user_login_request_model.dart';
import 'package:super_module/src/features/auth/data/requests/model/biometric_register_request_model.dart';
import 'package:super_module/src/features/auth/data/requests/model/check_username_request_model.dart';
import 'package:super_module/src/features/auth/data/requests/model/register_request_model.dart';
import 'package:super_module/src/features/user/data/requests/forgot_password_pin_verification_request_model.dart';

abstract class IAuthRemoteRepository {
  Future<LoginModel> authLogin(UserLoginRequestModel requestModel);

  Future<LoginModel> registerUser(RegisterRequestModel registerRequestModel);

  Future<ForgotPasswordPinVerificationResponseModel> resetPasswordByPhone(
      ForgotPasswordPinVerificationRequestModel
          forgotPasswordPinVerificationRequestModel);

  Future<ForgotPasswordPinVerificationResponseModel> verifyForgotPasswordOtp(
      ForgotPasswordPinVerificationRequestModel
          forgotPasswordPinVerificationRequestModel);

  Future<ForgotPasswordPinVerificationResponseModel> changeForgotPassword(
      ForgotPasswordPinVerificationRequestModel
          forgotPasswordPinVerificationRequestModel);

  Future<SocialModel> loginWithFacebook({required String token});

  Future<SocialModel> loginWithGoogle({required String token});

  Future<SocialModel> loginWithApple({required String token});

  Future<GlobalResponseModel> getOtp({String token});

  Future<GlobalResponseModel> verifyOtp(int otpCode);

  Future<GlobalResponseModel> checkUsername({CheckUsernameRequestModel model});

  Future<BiometricRegisterResponseModel> registerBiometric(
      BiometricRegisterRequestModel model);

  Future<EncryptedAccessTokenResponseModel> authenticateWithBiometrics(
      BiometricRegisterModel model);
}
