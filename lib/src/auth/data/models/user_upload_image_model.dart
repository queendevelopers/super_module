import 'package:json_annotation/json_annotation.dart';

part 'user_upload_image_model.g.dart';

@JsonSerializable()
class UserUploadImageModel {
  final String imageId;
  final String signedUrl;
  final String imageUrl;

  UserUploadImageModel({
    this.imageId,
    this.signedUrl,
    this.imageUrl,
  });

  factory UserUploadImageModel.fromJson(Map<String, dynamic> data) =>
      _$UserUploadImageModelFromJson(data);

  Map<String, dynamic> toJson() => _$UserUploadImageModelToJson(this);
}
