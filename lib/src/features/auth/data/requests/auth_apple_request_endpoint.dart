import 'package:flutter_rest_client/flutter_rest_client.dart';

class AuthAppleRequestEndpoint implements IRequestEndPoint {
  final String code;

  AuthAppleRequestEndpoint(this.code);

  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/auth/apple?code=$code';
}
