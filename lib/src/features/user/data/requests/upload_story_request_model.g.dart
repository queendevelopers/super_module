// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_story_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadStoryRequestModel _$UploadStoryRequestModelFromJson(
        Map<String, dynamic> json) =>
    UploadStoryRequestModel(
      fileName: json['fileName'] as String,
      fileType: json['fileType'] as String,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$UploadStoryRequestModelToJson(
        UploadStoryRequestModel instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'fileType': instance.fileType,
      'location': instance.location,
    };
