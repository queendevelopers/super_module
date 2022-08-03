// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      json['_id'] as String,
      json['largeImg'] as String?,
      json['bgImg'] as String?,
      json['desc'] as String?,
      json['welcomeDialogue'] as String?,
    );

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      '_id': instance.id,
      'largeImg': instance.largeImg,
      'desc': instance.desc,
      'bgImg': instance.bgImg,
      'welcomeDialogue': instance.welcomeDialogue,
    };
