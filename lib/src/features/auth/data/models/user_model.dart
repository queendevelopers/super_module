import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/features/auth/data/models/classroom.dart';
import 'package:super_module/src/features/auth/data/models/game_avatar.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UserModel extends BaseRequestModel {
  final GameAvatar? gameAvatar;
  final bool? emailVerified;
  bool? phoneVerified;
  final String? role;
  final String? status;
  final bool? social;
  final bool? socialLogin;
  final int? shotsDiscovered;
  final int? rank;
  final String? language;
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? email;
  final String? nickname;
  final int? points;
  final List<String>? subscribedCountries;
  final int? activeCountries;
  final String? phone;
  final String? avatar;
  final String? address;
  final String? username;
  final String? createdAt;
  final String? updatedAt;
  final double? score;
  final Classroom? classroom;

  UserModel({
    this.socialLogin,
    this.points,
    this.gameAvatar,
    this.shotsDiscovered,
    this.rank,
    this.subscribedCountries,
    this.activeCountries,
    this.username,
    this.emailVerified,
    this.nickname,
    this.phoneVerified,
    this.role,
    this.status,
    this.social,
    this.language,
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.score,
    this.classroom,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      _$UserModelFromJson(data);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
