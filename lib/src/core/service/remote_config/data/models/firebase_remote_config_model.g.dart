// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_remote_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseRemoteConfigModel _$FirebaseRemoteConfigModelFromJson(
    Map<String, dynamic> json) {
  return FirebaseRemoteConfigModel(
    json['latestVersion'] as String,
    json['minimumVersion'] as String,
    json['titleText'] as String,
    json['descriptionText'] as String,
    json['releaseNotes'] as String,
    json['isEnabled'] as bool,
  );
}

Map<String, dynamic> _$FirebaseRemoteConfigModelToJson(
        FirebaseRemoteConfigModel instance) =>
    <String, dynamic>{
      'latestVersion': instance.latestVersion,
      'minimumVersion': instance.minimumVersion,
      'titleText': instance.titleText,
      'descriptionText': instance.descriptionText,
      'releaseNotes': instance.releaseNotes,
      'isEnabled': instance.isEnabled,
    };
