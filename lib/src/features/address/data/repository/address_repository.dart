import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/address/data/endpoint/add_address_endpoint.dart';
import 'package:super_module/src/features/address/data/endpoint/delete_address_endpoint.dart';
import 'package:super_module/src/features/address/data/endpoint/get_default_address_endpoint.dart';
import 'package:super_module/src/features/address/data/endpoint/set_default_address_endpoint.dart';
import 'package:super_module/src/features/address/data/model/add_address_model.dart';
import 'package:super_module/src/features/address/data/model/shipping_address_list.dart';
import 'package:super_module/src/features/address/data/model/shipping_address_response.dart';
import 'package:super_module/src/features/address/data/request/add_address_request_model.dart';
import 'package:super_module/src/features/address/domain/repository/i_address_repository.dart';

@Injectable(as: IAddressRepository)
class AddressRepository implements IAddressRepository {
  final IHttpHelper iHttpHelper;

  AddressRepository(this.iHttpHelper);

  @override
  Future<AddAddressModel> addAddress(
      AddAddressRequestModel requestModel) async {
    final response =
        await iHttpHelper.request(AddAddressRequestEndpoint(), requestModel);
    return AddAddressModel.fromJson(response);
  }

  @override
  Future<ShippingAddressList> deleteAddress(String id) async {
    final response = await iHttpHelper.request(
        DeleteAddressRequestEndpoint(id), BaseRequestModel());
    print(response);
    return ShippingAddressList.fromJson(response);
  }

  @override
  Future<ShippingAddressResponse> getDefaultAddress() async {
    final response = await iHttpHelper.request(
        GetDefaultAddressEndpoint(), BaseRequestModel());
    print(response);

    return ShippingAddressResponse.fromJson(response);
  }

  @override
  Future<ShippingAddressResponse> setDefaultAddress(String id) async {
    final response = await iHttpHelper.request(
        SetDefaultAddressEndpoint(id), BaseRequestModel());
    return ShippingAddressResponse.fromJson(response);
  }
}
