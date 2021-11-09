import 'package:json_annotation/json_annotation.dart';
import 'package:rest_client/rest_client.dart';

part 'biometric_register_model.g.dart';

@JsonSerializable(includeIfNull: false)
class BiometricRegisterModel extends BaseRequestModel {
  final String? userId;
  final String? key;
  final String? encKey;
  final String? deviceId;
  final String? id;
  final String? privateKey;
  final String? publickey;

  BiometricRegisterModel(
      {this.key,
      this.id,
      this.userId,
      this.encKey,
      this.deviceId,
      this.privateKey,
      this.publickey});

  factory BiometricRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$BiometricRegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$BiometricRegisterModelToJson(this);
}
