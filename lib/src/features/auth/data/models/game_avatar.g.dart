// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameAvatar _$GameAvatarFromJson(Map<String, dynamic> json) {
  return GameAvatar(
    json['avatar'] == null
        ? null
        : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
    json['customName'] as String?,
  );
}

Map<String, dynamic> _$GameAvatarToJson(GameAvatar instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'customName': instance.customName,
    };
