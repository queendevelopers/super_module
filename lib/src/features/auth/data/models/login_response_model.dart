import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final bool? ok;
  final String? message;
  final String accessToken;
  final UserModel user;

  LoginResponseModel(
      {this.ok, this.message, required this.accessToken, required this.user});

  factory LoginResponseModel.fromJson(Map<String, dynamic> data) =>
      _$LoginResponseModelFromJson(data);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
