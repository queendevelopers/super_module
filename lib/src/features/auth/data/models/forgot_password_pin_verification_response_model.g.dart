// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_pin_verification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordPinVerificationResponseModel
    _$ForgotPasswordPinVerificationResponseModelFromJson(
        Map<String, dynamic> json) {
  return ForgotPasswordPinVerificationResponseModel(
    ok: json['ok'] as bool,
    message: json['message'] as String?,
    key: json['key'] as String?,
    token: json['token'] as String?,
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ForgotPasswordPinVerificationResponseModelToJson(
        ForgotPasswordPinVerificationResponseModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'message': instance.message,
      'token': instance.token,
      'key': instance.key,
      'user': instance.user,
    };
