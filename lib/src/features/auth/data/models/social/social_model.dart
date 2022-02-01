import 'package:json_annotation/json_annotation.dart';

import '../user_model.dart';

part 'social_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SocialModel {
  bool ok;
  String? accessToken;
  UserModel? user;
  String message;

  SocialModel(
      {required this.ok, this.accessToken, this.user, required this.message});

  factory SocialModel.fromJson(Map<String, dynamic> json) =>
      _$SocialModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocialModelToJson(this);
}
