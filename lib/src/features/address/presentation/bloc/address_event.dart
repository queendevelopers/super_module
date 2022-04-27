part of 'address_bloc.dart';

@immutable
abstract class AddressEvent {}

class SetDefaultAddressEvent extends AddressEvent {
  final String? id;

  SetDefaultAddressEvent(this.id);
}

class GetDefaultAddressEvent extends AddressEvent {}

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

  AddAddressEvent(
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
