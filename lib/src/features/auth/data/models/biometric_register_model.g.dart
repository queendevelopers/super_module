// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BiometricRegisterModel _$BiometricRegisterModelFromJson(
    Map<String, dynamic> json) {
  return BiometricRegisterModel(
    key: json['key'] as String?,
    id: json['id'] as String?,
    userId: json['userId'] as String?,
    encKey: json['encKey'] as String?,
    deviceId: json['deviceId'] as String?,
    privateKey: json['privateKey'] as String?,
    publickey: json['publickey'] as String?,
  );
}

Map<String, dynamic> _$BiometricRegisterModelToJson(
    BiometricRegisterModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  writeNotNull('key', instance.key);
  writeNotNull('encKey', instance.encKey);
  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('id', instance.id);
  writeNotNull('privateKey', instance.privateKey);
  writeNotNull('publickey', instance.publickey);
  return val;
}
