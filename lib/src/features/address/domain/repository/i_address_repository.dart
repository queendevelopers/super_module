import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:super_module/src/features/address/data/model/add_address_model.dart';
import 'package:super_module/src/features/address/data/model/shipping_address.dart';
import 'package:super_module/src/features/address/data/model/shipping_address_list.dart';
import 'package:super_module/src/features/address/data/model/shipping_address_response.dart';
import 'package:super_module/src/features/address/data/request/add_address_request_model.dart';

abstract class IAddressRepository {
  Future<AddAddressModel> addAddress(AddAddressRequestModel requestModel);

  Future<AddAddressModel> updateAddress(
      {required AddAddressRequestModel requestModel, required String id});

  Future<ShippingAddressList> deleteAddress(String id);

  Future<ShippingAddressResponse> setDefaultAddress(String id);

  Future<ShippingAddressResponse> getDefaultAddress();

  Future<ResponseEntityList<ShippingAddress>> getAddressList();
}
