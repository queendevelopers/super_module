import 'package:json_annotation/json_annotation.dart';
import 'package:rest_client/rest_client.dart';

part 'user_login_request_model.g.dart';

@JsonSerializable()
class UserLoginRequestModel extends BaseRequestModel {
  final String email;
  final String password;

  UserLoginRequestModel({required this.email, required this.password});

  factory UserLoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserLoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginRequestModelToJson(this);
}
