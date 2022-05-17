import 'package:flutter_rest_client/flutter_rest_client.dart';

class AddToCartEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => '/user/cart/add';
}
