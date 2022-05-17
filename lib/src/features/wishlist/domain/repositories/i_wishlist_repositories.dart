import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:super_module/src/features/wishlist/data/models/wish_list.dart';

abstract class IWishlistRepository {
  Future<ResponseEntityList<WishList>> getWishlistItems();
  Future<ResponseEntityList<WishList>> removeFromWishlist({required String id});
  Future<ResponseEntityList<WishList>> addToWishlist({required String id});
}
