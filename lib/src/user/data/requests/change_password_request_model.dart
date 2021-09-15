import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_model.g.dart';

@JsonSerializable()
class ChangePasswordRequestModel {
  String token;
  String newPassword;

  ChangePasswordRequestModel({this.token, this.newPassword});

  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> data) =>
      _$ChangePasswordRequestModelFromJson(data);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestModelToJson(this);
}
