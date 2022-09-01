// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_remote_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseRemoteConfigModel _$FirebaseRemoteConfigModelFromJson(
        Map<String, dynamic> json) =>
    FirebaseRemoteConfigModel(
      json['latestVersion'] as String,
      json['minimumVersion'] as String,
      json['releaseNotes'] as Map<String, dynamic>,
      json['isEnabled'] as bool,
      TitleModel.fromJson(json['title'] as Map<String, dynamic>),
      DescriptionModel.fromJson(json['description'] as Map<String, dynamic>),
      ButtonModel.fromJson(json['button'] as Map<String, dynamic>),
      RedirectModel.fromJson(json['redirect'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FirebaseRemoteConfigModelToJson(
        FirebaseRemoteConfigModel instance) =>
    <String, dynamic>{
      'latestVersion': instance.latestVersion,
      'minimumVersion': instance.minimumVersion,
      'title': instance.title.toJson(),
      'description': instance.description.toJson(),
      'button': instance.button.toJson(),
      'releaseNotes': instance.releaseNotes,
      'isEnabled': instance.isEnabled,
      'redirect': instance.redirect.toJson(),
    };
