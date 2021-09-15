import 'package:json_annotation/json_annotation.dart';

part 'upload_story_request_model.g.dart';

@JsonSerializable()
class UploadStoryRequestModel {
  String fileName;
  String fileType;
  String location;

  UploadStoryRequestModel({this.fileName, this.fileType, this.location});

  factory UploadStoryRequestModel.fromJson(Map<String, dynamic> data) =>
      _$UploadStoryRequestModelFromJson(data);

  Map<String, dynamic> toJson() => _$UploadStoryRequestModelToJson(this);
}
