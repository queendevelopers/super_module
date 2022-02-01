import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_pin_verification_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class ForgotPasswordPinVerificationRequestModel extends BaseRequestModel {
  String? key;
  int? code;
  String? password;
  String? phone;
  String? newPassword;
  String? token;

  ForgotPasswordPinVerificationRequestModel(
      {this.key,
      this.code,
      this.phone,
      this.newPassword,
      this.token,
      this.password = ''});

  factory ForgotPasswordPinVerificationRequestModel.fromJson(
          Map<String, dynamic> data) =>
      _$ForgotPasswordPinVerificationRequestModelFromJson(data);

  Map<String, dynamic> toJson() =>
      _$ForgotPasswordPinVerificationRequestModelToJson(this);
}
