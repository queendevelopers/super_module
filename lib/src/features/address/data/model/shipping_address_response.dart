import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/features/address/data/model/shipping_address.dart';

part 'shipping_address_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ShippingAddressResponse {
  final bool? ok;
  final String message;
  final ShippingAddress? data;

  ShippingAddressResponse(this.ok, this.message, this.data);

  factory ShippingAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressResponseToJson(this);
}
