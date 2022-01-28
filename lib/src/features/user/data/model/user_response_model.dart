import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  final bool ok;
  final UserModel data;
  final String message;

  UserResponseModel(this.ok, this.data, this.message);

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
