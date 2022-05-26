part of 'address_bloc.dart';

@immutable
abstract class AddressEvent {}

class SetDefaultAddressEvent extends AddressEvent {
  final String? id;

  SetDefaultAddressEvent(this.id);
}

class GetDefaultAddressEvent extends AddressEvent {}

class RemoveAddressEvent extends AddressEvent {
  final String id;

  RemoveAddressEvent(this.id);
}

class AddAddressEvent extends AddressEvent {
  final String? fullName;
  final String? name;
  final String? region;
  final String? address;
  final String? phone;
  final String? city;
  final String? road;
  final String? building;
  final String? floor;
  final String? room;
  final String? lat;
  final String? lng;
  final String? googleAddress;
  final String? additionalInfo;
  final RequestMethod requestMethod;

  AddAddressEvent(this.requestMethod,
      {this.fullName,
      this.phone,
      this.name,
      this.region,
      this.address,
      this.city,
      this.road,
      this.building,
      this.floor,
      this.room,
      this.googleAddress,
      this.additionalInfo,
      this.lat,
      this.lng});
}

class UpdateAddressEvent extends AddressEvent {
  final String addressId;
  final String? fullName;
  final String? name;
  final String? region;
  final String? address;
  final String? phone;
  final String? city;
  final String? road;
  final String? building;
  final String? floor;
  final String? room;
  final String? lat;
  final String? lng;
  final String? googleAddress;
  final String? additionalInfo;

  UpdateAddressEvent(this.addressId,
      {this.fullName,
      this.phone,
      this.name,
      this.region,
      this.address,
      this.city,
      this.road,
      this.building,
      this.floor,
      this.room,
      this.googleAddress,
      this.additionalInfo,
      this.lat,
      this.lng});
}

class GetAddressEvent extends AddressEvent {}
