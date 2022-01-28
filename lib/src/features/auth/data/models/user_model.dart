import 'package:json_annotation/json_annotation.dart';
import 'package:rest_client/rest_client.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UserModel extends BaseRequestModel {
  final bool? emailVerified;
  bool? phoneVerified;
  final String? role;
  final String? status;
  final bool? social;
  final String? language;
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? email;
  final String? nickname;
  final String? phone;
  final String? avatar;
  final String? address;
  final String? username;
  final String? createdAt;
  final String? updatedAt;
  final double? score;

  UserModel(
      {this.username,
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
      this.score});

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      _$UserModelFromJson(data);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
