// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginRequestModel _$UserLoginRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserLoginRequestModel(
      email: json['email'] as String?,
      password: json['password'] as String,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UserLoginRequestModelToJson(
        UserLoginRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'role': instance.role,
    };
