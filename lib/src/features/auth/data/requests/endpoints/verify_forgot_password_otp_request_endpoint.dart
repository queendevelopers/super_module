import 'package:rest_client/rest_client.dart';

class VerifyForgotPasswordOtpRequestEndPoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => '/auth/forgotpassword/phone/token';
}
