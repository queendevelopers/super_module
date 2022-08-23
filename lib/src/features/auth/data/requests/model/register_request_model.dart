import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel extends BaseRequestModel {
  final String? username;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String password;
  final String? role;
  final String? subrole;
  final String? schoolId;
  final String? panel;

  RegisterRequestModel({
    this.name,
    this.email,
    this.phone,
    this.address,
    required this.password,
    this.username,
    this.role,
    this.subrole,
    this.schoolId,
    this.panel,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
