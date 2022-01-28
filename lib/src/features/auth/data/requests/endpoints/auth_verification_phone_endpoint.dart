import 'package:rest_client/rest_client.dart';

class AuthVerificationPhoneEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/auth/verification/phone';
}
