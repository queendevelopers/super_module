import 'package:json_annotation/json_annotation.dart';

part 'avatar.g.dart';

@JsonSerializable()
class Avatar {
  @JsonKey(name: '_id')
  final String id;
  final String? largeImg;
  final String? desc;
  final String? bgImg;
  final String? welcomeDialogue;

  Avatar(this.id, this.largeImg, this.bgImg, this.desc, this.welcomeDialogue);

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}
