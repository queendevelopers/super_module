import 'package:json_annotation/json_annotation.dart';

part 'shipping_address.g.dart';

@JsonSerializable()
class ShippingAddress {
  @JsonKey(name: "_id")
  final String? id;
  final String? user;
  final String? fullName;
  final String? name;
  final String? address;
  final String? region;
  final String? phone;
  final String? googleAddress;
  final String? addressInfo;
  final String? lat;
  final String? lng;

  ShippingAddress(
      this.id,
      this.user,
      this.fullName,
      this.phone,
      this.googleAddress,
      this.addressInfo,
      this.lat,
      this.lng,
      this.name,
      this.address,
      this.region);

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}
