// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_pin_verification_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordPinVerificationRequestModel
    _$ForgotPasswordPinVerificationRequestModelFromJson(
        Map<String, dynamic> json) {
  return ForgotPasswordPinVerificationRequestModel(
    key: json['key'] as String,
    code: json['code'] as int,
    phone: json['phone'] as String,
    newPassword: json['newPassword'] as String,
    token: json['token'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$ForgotPasswordPinVerificationRequestModelToJson(
    ForgotPasswordPinVerificationRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('code', instance.code);
  writeNotNull('password', instance.password);
  writeNotNull('phone', instance.phone);
  writeNotNull('newPassword', instance.newPassword);
  writeNotNull('token', instance.token);
  return val;
}
