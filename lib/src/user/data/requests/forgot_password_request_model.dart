import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_request_model.g.dart';

@JsonSerializable()
class ForgotPasswordRequestModel {
  final String phone;

  ForgotPasswordRequestModel({this.phone});

  factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> data) =>
      _$ForgotPasswordRequestModelFromJson(data);

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestModelToJson(this);
}
