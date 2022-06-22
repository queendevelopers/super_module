// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redirect_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedirectModel _$RedirectModelFromJson(Map<String, dynamic> json) =>
    RedirectModel(
      json['appStoreUrl'] as String,
      json['playStoreUrl'] as String,
      json['microsoftStoreUrl'] as String,
      json['linuxStoreUrl'] as String,
      json['macOSStoreUrl'] as String,
      json['fuchsiaStoreUrl'] as String,
      json['otherStoreUrl'] as String,
    );

Map<String, dynamic> _$RedirectModelToJson(RedirectModel instance) =>
    <String, dynamic>{
      'appStoreUrl': instance.appStoreUrl,
      'playStoreUrl': instance.playStoreUrl,
      'microsoftStoreUrl': instance.microsoftStoreUrl,
      'linuxStoreUrl': instance.linuxStoreUrl,
      'macOSStoreUrl': instance.macOSStoreUrl,
      'fuchsiaStoreUrl': instance.fuchsiaStoreUrl,
      'otherStoreUrl': instance.otherStoreUrl,
    };
