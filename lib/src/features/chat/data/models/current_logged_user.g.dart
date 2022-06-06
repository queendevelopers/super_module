// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_logged_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentLoggedUser _$CurrentLoggedUserFromJson(Map<String, dynamic> json) {
  return CurrentLoggedUser(
    json['_id'] as String,
    json['email'] as String,
    json['schoolId'] as String,
    json['status'] as String,
    DateTime.parse(json['createdAt'] as String),
    DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$CurrentLoggedUserToJson(CurrentLoggedUser instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'schoolId': instance.schoolId,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
