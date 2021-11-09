import 'package:rest_client/rest_client.dart';

class AuthRegisterRequestEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => '/auth/register';
}
