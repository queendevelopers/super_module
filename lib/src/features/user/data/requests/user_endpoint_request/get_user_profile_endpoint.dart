import 'package:flutter_rest_client/flutter_rest_client.dart';

class GetUserProfileEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.PATCH;

  @override
  String get url => '/user/profile';
}