// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddressList _$ShippingAddressListFromJson(Map<String, dynamic> json) {
  return ShippingAddressList(
    json['ok'] as bool,
    json['message'] as String?,
    (json['data'] as List<dynamic>?)
        ?.map((e) => ShippingAddress.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShippingAddressListToJson(
        ShippingAddressList instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'message': instance.message,
      'data': instance.data,
    };
