import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/wishlist/data/models/wish_list.dart';
import 'package:super_module/src/features/wishlist/domain/repositories/i_wishlist_repositories.dart';

abstract class IWishlistController {
  Future<ResponseEntityList<WishList>> getWishlistItems();

  Future<ResponseEntityList<WishList>> removeFromWishlist({required String id});

  Future<ResponseEntityList<WishList>> addToWishlist({required String id});
}

@Injectable(as: IWishlistController)
class WishlistController implements IWishlistController {
  final IWishlistRepository repository;

  WishlistController(this.repository);

  @override
  Future<ResponseEntityList<WishList>> addToWishlist(
      {required String id}) async {
    return await repository.addToWishlist(id: id);
  }

  @override
  Future<ResponseEntityList<WishList>> getWishlistItems() async {
    return await repository.getWishlistItems();
  }

  @override
  Future<ResponseEntityList<WishList>> removeFromWishlist(
      {required String id}) async {
    return await repository.removeFromWishlist(id: id);
  }
}
