import 'package:rest_client/rest_client.dart';

class BiometricRegisterEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => '/user/auth/biometric';
}
