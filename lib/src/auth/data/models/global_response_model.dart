import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/auth/data/models/user_model.dart';

part 'global_response_model.g.dart';

@JsonSerializable()
class GlobalResponseModel {
  final bool ok;
  final String message;
  final String code;
  final String field;
  final String key;
  final int otp;
  final UserModel user;
  final String encryptedAccessToken;

  GlobalResponseModel(
      this.user, this.code, this.field, this.encryptedAccessToken,
      {this.ok, this.message, this.key, this.otp});

  factory GlobalResponseModel.fromJson(Map<String, dynamic> data) =>
      _$GlobalResponseModelFromJson(data);

  Map<String, dynamic> toJson() => _$GlobalResponseModelToJson(this);
}
