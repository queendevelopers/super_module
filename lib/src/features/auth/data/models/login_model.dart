import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';

part 'login_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginModel {
  final bool ok;
  final String? accessToken;
  final String message;
  final String? key;
  final UserModel? user;

  LoginModel(this.ok, this.accessToken, this.message, this.user, this.key);

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
