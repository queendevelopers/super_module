// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalResponseModel _$GlobalResponseModelFromJson(Map<String, dynamic> json) {
  return GlobalResponseModel(
    json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    json['code'] as String,
    json['field'] as String,
    json['encryptedAccessToken'] as String,
    ok: json['ok'] as bool,
    message: json['message'] as String,
    key: json['key'] as String,
    otp: json['otp'] as int,
  );
}

Map<String, dynamic> _$GlobalResponseModelToJson(
        GlobalResponseModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'message': instance.message,
      'code': instance.code,
      'field': instance.field,
      'key': instance.key,
      'otp': instance.otp,
      'user': instance.user,
      'encryptedAccessToken': instance.encryptedAccessToken,
    };
