import 'package:rest_client/rest_client.dart';

class AuthWithBiometicsEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => '/auth/login/biometric';
}
