import 'package:json_annotation/json_annotation.dart';

part 'game_avatar.g.dart';

@JsonSerializable()
class GameAvatar {
  final String? avatar;
  final String? customName;

  GameAvatar(this.avatar, this.customName);

  factory GameAvatar.fromJson(Map<String, dynamic> json) =>
      _$GameAvatarFromJson(json);

  Map<String, dynamic> toJson() => _$GameAvatarToJson(this);
}
