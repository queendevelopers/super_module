import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_login_request_model.g.dart';

@JsonSerializable()
class UserLoginRequestModel extends IRequestModel {
  final String? email;
  final String password;
  final String? phone;
  final String? role;

  UserLoginRequestModel({this.email, required this.password,this.phone,this.role});

  factory UserLoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserLoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginRequestModelToJson(this);
}
