// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginRequestModel _$UserLoginRequestModelFromJson(
    Map<String, dynamic> json) {
  return UserLoginRequestModel(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$UserLoginRequestModelToJson(
        UserLoginRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
