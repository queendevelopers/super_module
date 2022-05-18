import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/address/data/model/add_address_model.dart';
import 'package:super_module/src/features/address/data/model/shipping_address_list.dart';
import 'package:super_module/src/features/address/data/model/shipping_address_response.dart';
import 'package:super_module/src/features/address/data/request/add_address_request_model.dart';
import 'package:super_module/src/features/address/domain/repository/i_address_repository.dart';

abstract class IAddressController {
  Future<AddAddressModel> addAddress(AddAddressRequestModel requestModel);

  Future<AddAddressModel> updateAddress(
      {required AddAddressRequestModel requestModel, required String id});

  Future<ShippingAddressList> deleteAddress(String id);

  Future<ShippingAddressResponse> setDefaultAddress(String id);

  Future<ShippingAddressResponse> getDefaultAddress();
}

@Injectable(as: IAddressController)
class CheckoutController implements IAddressController {
  final IAddressRepository repository;

  CheckoutController(this.repository);

  @override
  Future<AddAddressModel> addAddress(
      AddAddressRequestModel requestModel) async {
    final response = await repository.addAddress(requestModel);
    return response;
  }

  @override
  Future<ShippingAddressList> deleteAddress(String id) async {
    final response = await repository.deleteAddress(id);
    return response;
  }

  @override
  Future<ShippingAddressResponse> getDefaultAddress() async {
    return await repository.getDefaultAddress();
  }

  @override
  Future<ShippingAddressResponse> setDefaultAddress(String id) async {
    return await repository.setDefaultAddress(id);
  }

  @override
  Future<AddAddressModel> updateAddress(
      {required AddAddressRequestModel requestModel,
      required String id}) async {
    final response =
        await repository.updateAddress(requestModel: requestModel, id: id);
    return response;
  }
}
