// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_address_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAddressRequestModel _$AddAddressRequestModelFromJson(
    Map<String, dynamic> json) {
  return AddAddressRequestModel(
    fullName: json['fullName'] as String?,
    name: json['name'] as String?,
    address: json['address'] as String?,
    region: json['region'] as String?,
    phone: json['phone'] as String?,
    city: json['city'] as String?,
    road: json['road'] as String?,
    building: json['building'] as String?,
    floor: json['floor'] as String?,
    room: json['room'] as String?,
    googleAddress: json['googleAddress'] as String?,
    addressInfo: json['addressInfo'] as String?,
    lat: json['lat'] as String?,
    lng: json['lng'] as String?,
  );
}

Map<String, dynamic> _$AddAddressRequestModelToJson(
    AddAddressRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fullName', instance.fullName);
  writeNotNull('name', instance.name);
  writeNotNull('address', instance.address);
  writeNotNull('region', instance.region);
  writeNotNull('phone', instance.phone);
  writeNotNull('city', instance.city);
  writeNotNull('road', instance.road);
  writeNotNull('building', instance.building);
  writeNotNull('floor', instance.floor);
  writeNotNull('room', instance.room);
  writeNotNull('lat', instance.lat);
  writeNotNull('lng', instance.lng);
  writeNotNull('googleAddress', instance.googleAddress);
  writeNotNull('addressInfo', instance.addressInfo);
  return val;
}
