import 'package:json_annotation/json_annotation.dart';

import 'encrypted_access_token_model.dart';

part 'encrypted_access_token_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EncryptedAccessTokenResponseModel {
  final bool ok;
  final EncryptedAccessTokenModel data;
  final String message;

  EncryptedAccessTokenResponseModel(this.ok, this.data, this.message);

  factory EncryptedAccessTokenResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$EncryptedAccessTokenResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EncryptedAccessTokenResponseModelToJson(this);
}
