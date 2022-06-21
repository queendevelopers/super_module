// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequestModel _$ChangePasswordRequestModelFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordRequestModel(
      token: json['token'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$ChangePasswordRequestModelToJson(
        ChangePasswordRequestModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'newPassword': instance.newPassword,
    };
