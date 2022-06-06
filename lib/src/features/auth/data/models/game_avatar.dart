import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/features/auth/data/models/avatar.dart';

part 'game_avatar.g.dart';

@JsonSerializable()
class GameAvatar {
  final Avatar? avatar;
  final String? customName;

  GameAvatar(this.avatar, this.customName);

  factory GameAvatar.fromJson(Map<String, dynamic> json) =>
      _$GameAvatarFromJson(json);

  Map<String, dynamic> toJson() => _$GameAvatarToJson(this);
}
