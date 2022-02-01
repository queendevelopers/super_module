part of 'address_bloc.dart';

@immutable
abstract class AddressState {}

class AddressInitial extends AddressState {}

class GetDefaultAddressSuccess extends AddressState {
  final ShippingAddress? model;

  GetDefaultAddressSuccess(this.model);
}

class GetDefaultAddressFetching extends AddressState {}

class GetDefaultAddressFetchFailure extends AddressState {
  final String message;

  GetDefaultAddressFetchFailure({required this.message});
}

class SetDefaultAddressSuccess extends AddressState {
  final ShippingAddress? model;
  final String? id;

  SetDefaultAddressSuccess(this.model, this.id);
}

class SetDefaultAddressFetching extends AddressState {}

class SetDefaultAddressFetchFailure extends AddressState {
  final String message;

  SetDefaultAddressFetchFailure({required this.message});
}

class AddAddressPostState extends AddressState {}

class AddAddressPostFailureState extends AddressState {
  final String message;

  AddAddressPostFailureState({required this.message});
}

class AddAddressPostSuccessState extends AddressState {
  final AddAddressModel? addAddressModel;

  AddAddressPostSuccessState({this.addAddressModel});
}
