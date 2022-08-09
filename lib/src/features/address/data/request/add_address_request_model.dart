import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_address_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class AddAddressRequestModel implements IRequestModel {
  final String? fullName;
  final String? name;
  final String? address;
  final String? region;
  final String? phone;
  final String? city;
  final String? road;
  final String? building;
  final String? floor;
  final String? room;
  final String? lat;
  final String? lng;
  final String? googleAddress;
  final String? addressInfo;
  final bool? isDefault;

  AddAddressRequestModel(
      {this.fullName,
      this.name,
      this.address,
      this.region,
      this.phone,
      this.city,
      this.road,
      this.building,
      this.floor,
      this.room,
      this.googleAddress,
      this.addressInfo,
      this.lat,
      this.isDefault,
      this.lng});

  factory AddAddressRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddAddressRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddAddressRequestModelToJson(this);
}
