// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddressResponse _$ShippingAddressResponseFromJson(
        Map<String, dynamic> json) =>
    ShippingAddressResponse(
      json['ok'] as bool?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : ShippingAddress.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShippingAddressResponseToJson(
        ShippingAddressResponse instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };