// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      json['ok'] as bool,
      json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
      json['message'] as String?,
    );

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'data': instance.data,
      'message': instance.message,
    };
