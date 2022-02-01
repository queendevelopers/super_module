import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel extends BaseRequestModel {
  final String? username;
  final String? name;
  final String email;
  final String? phone;
  final String? address;
  final String password;

  RegisterRequestModel(
      {this.name,
      required this.email,
      this.phone,
      this.address,
      required this.password,
      this.username});

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
