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
      json['name'] as String?,
      json['address'] as String?,
      json['isDefault'] as bool?,
      json['region'] as String?,
    );

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'fullName': instance.fullName,
      'name': instance.name,
      'address': instance.address,
      'region': instance.region,
      'phone': instance.phone,
      'googleAddress': instance.googleAddress,
      'addressInfo': instance.addressInfo,
      'lat': instance.lat,
      'lng': instance.lng,
      'isDefault': instance.isDefault,
    };
