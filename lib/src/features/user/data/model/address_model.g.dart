// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      json['city'] as String?,
      json['state'] as String?,
      json['country'] as String?,
      json['suburb'] as String?,
      json['postcode'] as String?,
      json['pedestrian'] as String?,
      json['country_code'] as String?,
      json['country_district'] as String?,
      json['county'] as String?,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'county': instance.county,
      'suburb': instance.suburb,
      'country': instance.country,
      'postcode': instance.postcode,
      'pedestrian': instance.pedestrian,
      'country_code': instance.countryCode,
      'country_district': instance.cityDistrict,
    };
