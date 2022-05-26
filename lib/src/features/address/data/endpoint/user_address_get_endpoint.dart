import 'package:flutter_rest_client/flutter_rest_client.dart';

class UserAddressGetEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/user/shipping/address';
}
