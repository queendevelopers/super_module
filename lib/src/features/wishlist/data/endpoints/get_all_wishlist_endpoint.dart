import 'package:flutter_rest_client/flutter_rest_client.dart';

class GetAllWishlistEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/user/wishlist';
}
