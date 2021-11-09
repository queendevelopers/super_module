import 'package:json_annotation/json_annotation.dart';

part 'encrypted_access_token_model.g.dart';

@JsonSerializable()
class EncryptedAccessTokenModel {
  final String encryptedAccessToken;

  EncryptedAccessTokenModel(this.encryptedAccessToken);

  factory EncryptedAccessTokenModel.fromJson(Map<String, String> json) =>
      _$EncryptedAccessTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptedAccessTokenModelToJson(this);
}
