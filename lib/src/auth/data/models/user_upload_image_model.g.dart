// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_upload_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUploadImageModel _$UserUploadImageModelFromJson(Map<String, dynamic> json) {
  return UserUploadImageModel(
    imageId: json['imageId'] as String,
    signedUrl: json['signedUrl'] as String,
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$UserUploadImageModelToJson(
        UserUploadImageModel instance) =>
    <String, dynamic>{
      'imageId': instance.imageId,
      'signedUrl': instance.signedUrl,
      'imageUrl': instance.imageUrl,
    };
