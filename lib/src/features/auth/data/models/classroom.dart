import 'package:json_annotation/json_annotation.dart';

part 'classroom.g.dart';

@JsonSerializable()
class Classroom {
  @JsonKey(name: '_id')
  final String id;
  final String? school;
  final String? status;
  final String? classCode;
  final String? course;

  Classroom(this.id, this.school, this.status, this.classCode, this.course);

  factory Classroom.fromJson(Map<String, dynamic> json) =>
      _$ClassroomFromJson(json);

  Map<String, dynamic> toJson() => _$ClassroomToJson(this);
}
