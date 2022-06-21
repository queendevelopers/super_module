// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BiometricRegisterResponseModel _$BiometricRegisterResponseModelFromJson(
        Map<String, dynamic> json) =>
    BiometricRegisterResponseModel(
      json['ok'] as bool,
      BiometricRegisterModel.fromJson(json['data'] as Map<String, dynamic>),
      json['message'] as String,
    );

Map<String, dynamic> _$BiometricRegisterResponseModelToJson(
        BiometricRegisterResponseModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'data': instance.data.toJson(),
      'message': instance.message,
    };
