// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Classroom _$ClassroomFromJson(Map<String, dynamic> json) {
  return Classroom(
    json['_id'] as String,
    json['school'] as String?,
    json['status'] as String?,
    json['classCode'] as String?,
    json['course'] as String?,
  );
}

Map<String, dynamic> _$ClassroomToJson(Classroom instance) => <String, dynamic>{
      '_id': instance.id,
      'school': instance.school,
      'status': instance.status,
      'classCode': instance.classCode,
      'course': instance.course,
    };
