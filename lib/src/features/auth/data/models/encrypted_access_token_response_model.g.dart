// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encrypted_access_token_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EncryptedAccessTokenResponseModel _$EncryptedAccessTokenResponseModelFromJson(
    Map<String, dynamic> json) {
  return EncryptedAccessTokenResponseModel(
    json['ok'] as bool,
    EncryptedAccessTokenModel.fromJson(
        Map<String, String>.from(json['data'] as Map)),
    json['message'] as String,
  );
}

Map<String, dynamic> _$EncryptedAccessTokenResponseModelToJson(
        EncryptedAccessTokenResponseModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'data': instance.data.toJson(),
      'message': instance.message,
    };
