import 'package:flutter_rest_client/flutter_rest_client.dart';

class RemoveFromWishlistEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => '/user/wishlist/remove';
}
