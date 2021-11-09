// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) =>
    ShippingAddress(
      json['_id'] as String?,
      json['user'] as String?,
      json['fullName'] as String?,
      json['phone'] as String?,
      json['googleAddress'] as String?,
      json['addressInfo'] as String?,
      json['lat'] as String?,
      json['lng'] as String?,
    );

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'googleAddress': instance.googleAddress,
      'addressInfo': instance.addressInfo,
      'lat': instance.lat,
      'lng': instance.lng,
    };
