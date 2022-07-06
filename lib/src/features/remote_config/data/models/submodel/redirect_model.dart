import 'package:json_annotation/json_annotation.dart';

part 'redirect_model.g.dart';

@JsonSerializable()
class RedirectModel {
  final String appStoreUrl;
  final String playStoreUrl;
  final String microsoftStoreUrl;
  final String linuxStoreUrl;
  final String macOSStoreUrl;
  final String fuchsiaStoreUrl;
  final String otherStoreUrl;

  RedirectModel(
      this.appStoreUrl,
      this.playStoreUrl,
      this.microsoftStoreUrl,
      this.linuxStoreUrl,
      this.macOSStoreUrl,
      this.fuchsiaStoreUrl,
      this.otherStoreUrl);

  factory RedirectModel.fromJson(Map<String, dynamic> json) =>
      _$RedirectModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedirectModelToJson(this);
}
