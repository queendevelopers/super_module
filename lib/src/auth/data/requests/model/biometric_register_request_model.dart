import 'package:json_annotation/json_annotation.dart';
import 'package:rest_client/rest_client.dart';

part 'biometric_register_request_model.g.dart';

@JsonSerializable()
class BiometricRegisterRequestModel extends BaseRequestModel {
  final String? publicKey;
  final String? privateKey;
  final String? deviceId;

  BiometricRegisterRequestModel(
      {this.privateKey, this.publicKey, this.deviceId});

  factory BiometricRegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BiometricRegisterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$BiometricRegisterRequestModelToJson(this);
}
