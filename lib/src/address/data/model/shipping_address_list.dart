import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/address/data/model/shipping_address.dart';

part 'shipping_address_list.g.dart';

@JsonSerializable()
class ShippingAddressList {
  final bool ok;
  final String message;
  final List<ShippingAddress> data;

  ShippingAddressList(this.ok, this.message, this.data);

  factory ShippingAddressList.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressListFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressListToJson(this);
}
