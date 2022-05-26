import 'package:json_annotation/json_annotation.dart';

part 'current_logged_user.g.dart';

@JsonSerializable()
class CurrentLoggedUser {
  @JsonKey(name: '_id')
  final String id;
  final String email;
  final String schoolId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  CurrentLoggedUser(this.id, this.email, this.schoolId, this.status,
      this.createdAt, this.updatedAt);

  factory CurrentLoggedUser.fromJson(Map<String, dynamic> json) =>
      _$CurrentLoggedUserFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentLoggedUserToJson(this);
}
