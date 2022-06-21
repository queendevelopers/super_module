// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_current_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCurrentLocation _$UserCurrentLocationFromJson(Map<String, dynamic> json) =>
    UserCurrentLocation(
      CurrentLocation.fromJson(json['currentLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCurrentLocationToJson(
        UserCurrentLocation instance) =>
    <String, dynamic>{
      'currentLocation': instance.currentLocation.toJson(),
    };
