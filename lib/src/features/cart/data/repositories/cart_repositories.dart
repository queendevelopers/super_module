import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:flutter_rest_client/src/dio/response/response_entity_list.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/cart/data/endpoints/add_to_cart_endpoint.dart';
import 'package:super_module/src/features/cart/data/endpoints/get_all_cart_endpoint.dart';
import 'package:super_module/src/features/cart/data/models/cart_list.dart';
import 'package:super_module/src/features/cart/domain/repositories/i_cart_repositories.dart';
import 'package:super_module/src/features/wishlist/data/request/action_request_model.dart';

@Injectable(as: ICartRepository)
class CartRepositories implements ICartRepository {
  final IHttpHelper httpHelper;

  CartRepositories(this.httpHelper);

  @override
  Future<ResponseEntityList<Cart>> addToCart({required String id}) async {
    try {
      final response = await httpHelper.request(
          AddToCartEndpoint(), ActionRequestModel('add', id));
      return ResponseEntityList<Cart>.fromJson(
          fromJson: (json) => Cart.fromJson(json), json: response);
    } catch (e) {
      return ResponseEntityList<Cart>.withError(
          ErrorParser.parseDioException(e));
    }
  }

  @override
  Future<ResponseEntityList<Cart>> getCartItems() async {
    try {
      final response =
          await httpHelper.request(GetAllCartEndpoint(), BaseRequestModel());
      return ResponseEntityList<Cart>.fromJson(
          fromJson: (json) => Cart.fromJson(json), json: response);
    } catch (e) {
      return ResponseEntityList<Cart>.withError(
          ErrorParser.parseDioException(e));
    }
  }

  @override
  Future<ResponseEntityList<Cart>> removeFromCart({required String id}) async {
    try {
      final response = await httpHelper.request(
          AddToCartEndpoint(), ActionRequestModel('remove', id));
      return ResponseEntityList<Cart>.fromJson(
          fromJson: (json) => Cart.fromJson(json), json: response);
    } catch (e) {
      return ResponseEntityList<Cart>.withError(
          ErrorParser.parseDioException(e));
    }
  }
}
