import 'package:rest_client/rest_client.dart';

class ResetForgotPasswordRequestEndPoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => '/auth/forgotpassword/phone';
}
