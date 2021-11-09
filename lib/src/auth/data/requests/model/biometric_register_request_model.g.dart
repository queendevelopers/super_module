// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BiometricRegisterRequestModel _$BiometricRegisterRequestModelFromJson(
        Map<String, dynamic> json) =>
    BiometricRegisterRequestModel(
      privateKey: json['privateKey'] as String?,
      publicKey: json['publicKey'] as String?,
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$BiometricRegisterRequestModelToJson(
        BiometricRegisterRequestModel instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
      'privateKey': instance.privateKey,
      'deviceId': instance.deviceId,
    };
