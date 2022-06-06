// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestModel _$RegisterRequestModelFromJson(Map<String, dynamic> json) {
  return RegisterRequestModel(
    name: json['name'] as String?,
    email: json['email'] as String,
    phone: json['phone'] as String?,
    address: json['address'] as String?,
    password: json['password'] as String,
    username: json['username'] as String?,
    role: json['role'] as String?,
    subrole: json['subrole'] as String?,
    schoolId: json['schoolId'] as String?,
  );
}

Map<String, dynamic> _$RegisterRequestModelToJson(
        RegisterRequestModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'password': instance.password,
      'role': instance.role,
      'subrole': instance.subrole,
      'schoolId': instance.schoolId,
    };
