import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({this.email, this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> data) =>
      _$LoginRequestModelFromJson(data);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
