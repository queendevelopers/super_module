import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/cart/data/models/cart_list.dart';
import 'package:super_module/src/features/cart/domain/repositories/i_cart_repositories.dart';

abstract class ICartController {
  Future<ResponseEntityList<Cart>> getCartItems();

  Future<ResponseEntityList<Cart>> removeFromCart({required String id});

  Future<ResponseEntityList<Cart>> addToCart({required String id});

  Future<ResponseEntityList<Cart>> updateCartQuantity({
    required String id,
    required bool isMinus,
  });
}

@Injectable(as: ICartController)
class CartController implements ICartController {
  final ICartRepository repository;

  CartController(this.repository);

  @override
  Future<ResponseEntityList<Cart>> addToCart({required String id}) async {
    return await repository.addToCart(id: id);
  }

  @override
  Future<ResponseEntityList<Cart>> getCartItems() async {
    return await repository.getCartItems();
  }

  @override
  Future<ResponseEntityList<Cart>> removeFromCart({required String id}) async {
    return await repository.removeFromCart(id: id);
  }

  @override
  Future<ResponseEntityList<Cart>> updateCartQuantity(
      {required String id, required bool isMinus}) async {
    return await repository.updateCartQuantity(id: id, isMinus: isMinus);
  }
}
