import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:flutter_rest_client/src/dio/response/response_entity_list.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/wishlist/data/endpoints/add_to_wishlist_endpoint.dart';
import 'package:super_module/src/features/wishlist/data/endpoints/get_all_wishlist_endpoint.dart';
import 'package:super_module/src/features/wishlist/data/models/wish_list.dart';
import 'package:super_module/src/features/wishlist/data/request/action_request_model.dart';
import 'package:super_module/src/features/wishlist/domain/repositories/i_wishlist_repositories.dart';

@Injectable(as: IWishlistRepository)
class WishlistRepositories implements IWishlistRepository {
  final IHttpHelper httpHelper;

  WishlistRepositories(this.httpHelper);

  @override
  Future<ResponseEntityList<WishList>> addToWishlist(
      {required String id}) async {
    try {
      final response = await httpHelper.request(
          AddToWishlistEndpoint(), ActionRequestModel('add', id));
      return ResponseEntityList<WishList>.fromJson(
          fromJson: (json) => WishList.fromJson(json), json: response);
    } catch (e) {
      return ResponseEntityList<WishList>.withError(
          ErrorParser.parseDioException(e));
    }
  }

  @override
  Future<ResponseEntityList<WishList>> getWishlistItems() async {
    try {
      final response = await httpHelper.request(
          GetAllWishlistEndpoint(), BaseRequestModel());
      return ResponseEntityList<WishList>.fromJson(
          fromJson: (json) => WishList.fromJson(json), json: response);
    } catch (e) {
      return ResponseEntityList<WishList>.withError(
          ErrorParser.parseDioException(e));
    }
  }

  @override
  Future<ResponseEntityList<WishList>> removeFromWishlist(
      {required String id}) async {
    try {
      final response = await httpHelper.request(
          AddToWishlistEndpoint(), ActionRequestModel('remove', id));
      return ResponseEntityList<WishList>.fromJson(
          fromJson: (json) => WishList.fromJson(json), json: response);
    } catch (e) {
      return ResponseEntityList<WishList>.withError(
          ErrorParser.parseDioException(e));
    }
  }
}
