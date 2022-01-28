import 'package:json_annotation/json_annotation.dart';

import 'biometric_register_model.dart';

part 'biometric_register_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BiometricRegisterResponseModel {
  final bool ok;
  final BiometricRegisterModel data;
  final String message;

  BiometricRegisterResponseModel(this.ok, this.data, this.message);

  factory BiometricRegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BiometricRegisterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BiometricRegisterResponseModelToJson(this);
}
