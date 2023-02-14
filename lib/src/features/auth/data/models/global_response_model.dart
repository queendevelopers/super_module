import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';

part 'global_response_model.g.dart';

@JsonSerializable()
class GlobalResponseModel {
  final bool ok;
  @JsonKey(name: 'message', defaultValue: "Process Complete")
  final String message;
  final String? code;
  final String? field;
  final String? key;
  final int? otp;
  final UserModel? user;
  final String? encryptedAccessToken;
   num? amount;

  GlobalResponseModel(
      this.user, this.code, this.field, this.encryptedAccessToken,
      {required this.ok,
      this.message = "Process Complete",
      this.key,
      this.otp,this.amount});

  factory GlobalResponseModel.fromJson(Map<String, dynamic> data) =>
      _$GlobalResponseModelFromJson(data);

  Map<String, dynamic> toJson() => _$GlobalResponseModelToJson(this);
}
