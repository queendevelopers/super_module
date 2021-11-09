import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/auth/data/models/user_model.dart';

part 'forgot_password_pin_verification_response_model.g.dart';

@JsonSerializable()
class ForgotPasswordPinVerificationResponseModel {
  bool? ok;
  String? message;
  String? token;
  String? key;
  UserModel? user;

  ForgotPasswordPinVerificationResponseModel(
      {this.ok, this.message, this.key, this.token, this.user});

  factory ForgotPasswordPinVerificationResponseModel.fromJson(
          Map<String, dynamic> data) =>
      _$ForgotPasswordPinVerificationResponseModelFromJson(data);

  Map<String, dynamic> toJson() =>
      _$ForgotPasswordPinVerificationResponseModelToJson(this);
}
