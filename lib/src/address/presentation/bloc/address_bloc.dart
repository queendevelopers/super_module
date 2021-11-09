import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_module/src/address/data/model/add_address_model.dart';
import 'package:super_module/src/address/data/model/shipping_address.dart';
import 'package:super_module/src/address/data/request/add_address_request_model.dart';
import 'package:super_module/src/address/domain/controller/i_address_controller.dart';

part 'address_event.dart';

part 'address_state.dart';

@injectable
class AddressBloc extends Bloc<AddressEvent, AddressState>
    with ReadAddressBloc, UpdateAddressBloc {
  final IAddressController controller;

  AddressBloc(this.controller) : super(AddressInitial());

  @override
  Stream<AddressState> mapEventToState(
    AddressEvent event,
  ) async* {
    if (event is SetDefaultAddressEvent) {
      yield SetDefaultAddressFetching();
      final response = await controller.setDefaultAddress(event.id!);
      if (response.ok!) {
        yield SetDefaultAddressSuccess(response.data, event.id);
        return;
      }
      yield SetDefaultAddressFetchFailure(message: response.message);
    } else if (event is GetDefaultAddressEvent) {
      yield GetDefaultAddressFetching();
      final response = await controller.getDefaultAddress();
      if (response.ok!) {
        yield GetDefaultAddressSuccess(response.data);
        return;
      }
      yield GetDefaultAddressFetchFailure(message: response.message);
    } else if (event is AddAddressEvent) {
      if (state is! AddAddressPostState) {
        yield AddAddressPostState();
        final requestModel = AddAddressRequestModel(
          fullName: event.fullName,
          phone: event.phone,
          city: event.city,
          road: event.road,
          building: event.building,
          addressInfo: event.additionalInfo,
          googleAddress: event.googleAddress,
          floor: event.floor,
          room: event.room,
          lat: event.lat,
          lng: event.lng,
        );
        final response = await controller.addAddress(requestModel);
        if (response.ok!) {
          yield AddAddressPostSuccessState(addAddressModel: response);
          return;
        }
        yield AddAddressPostFailureState(message: response.message);
      }
    }
  }
}

mixin ReadAddressBloc on Bloc<AddressEvent, AddressState> {}
mixin UpdateAddressBloc on Bloc<AddressEvent, AddressState> {}
