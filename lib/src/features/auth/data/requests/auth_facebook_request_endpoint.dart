import 'package:rest_client/rest_client.dart';

class AuthFacebookRequestEndpoint implements IRequestEndPoint {
  final String token;

  AuthFacebookRequestEndpoint(this.token);

  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/auth/facebook?accessToken=$token';
}
