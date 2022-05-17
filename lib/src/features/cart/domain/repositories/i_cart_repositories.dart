import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:super_module/src/features/cart/data/models/cart_list.dart';

abstract class ICartRepository {
  Future<ResponseEntityList<Cart>> getCartItems();
  Future<ResponseEntityList<Cart>> removeFromCart({required String id});
  Future<ResponseEntityList<Cart>> addToCart({required String id});
}
