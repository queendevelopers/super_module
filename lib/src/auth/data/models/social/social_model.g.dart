// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialModel _$SocialModelFromJson(Map<String, dynamic> json) {
  return SocialModel(
    ok: json['ok'] as bool,
    accessToken: json['accessToken'] as String,
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$SocialModelToJson(SocialModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'accessToken': instance.accessToken,
      'user': instance.user?.toJson(),
      'message': instance.message,
    };
