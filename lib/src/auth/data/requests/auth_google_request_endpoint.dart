import 'package:rest_client/rest_client.dart';

class AuthGoogleRequestEndpoint implements IRequestEndPoint {
  final String token;

  AuthGoogleRequestEndpoint(this.token);

  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/auth/google?accessToken=$token';
}
