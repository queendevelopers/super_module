// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      json['ok'] as bool,
      json['accessToken'] as String?,
      json['message'] as String?,
      json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      json['key'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'accessToken': instance.accessToken,
      'message': instance.message,
      'key': instance.key,
      'user': instance.user?.toJson(),
    };
