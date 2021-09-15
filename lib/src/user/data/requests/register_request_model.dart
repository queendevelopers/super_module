import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  String name;
  String email;
  String phone;
  String password;

  RegisterRequestModel({this.name, this.email, this.phone, this.password});

  factory RegisterRequestModel.fromJson(Map<String, dynamic> data) =>
      _$RegisterRequestModelFromJson(data);

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
