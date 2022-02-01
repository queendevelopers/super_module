import 'package:flutter_rest_client/flutter_rest_client.dart';

class AddAddressRequestEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => '/user/shipping/address';
}
