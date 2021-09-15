// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encrypted_access_token_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EncryptedAccessTokenResponseModel _$EncryptedAccessTokenResponseModelFromJson(
    Map<String, dynamic> json) {
  return EncryptedAccessTokenResponseModel(
    json['ok'] as bool,
    json['data'] == null
        ? null
        : EncryptedAccessTokenModel.fromJson(
            (json['data'] as Map<String, dynamic>)?.map(
            (k, e) => MapEntry(k, e as String),
          )),
    json['message'] as String,
  );
}

Map<String, dynamic> _$EncryptedAccessTokenResponseModelToJson(
        EncryptedAccessTokenResponseModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'data': instance.data?.toJson(),
      'message': instance.message,
    };
