import 'package:json_annotation/json_annotation.dart';

part 'firebase_remote_config_model.g.dart';

@JsonSerializable()
class FirebaseRemoteConfigModel {
  final String latestVersion;
  final String minimumVersion;
  final String titleText;
  final String descriptionText;
  final String releaseNotes;
  final bool isEnabled;

  FirebaseRemoteConfigModel(this.latestVersion, this.minimumVersion,
      this.titleText, this.descriptionText, this.releaseNotes, this.isEnabled);

  factory FirebaseRemoteConfigModel.fromJson(Map<String, dynamic> json) =>
      _$FirebaseRemoteConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$FirebaseRemoteConfigModelToJson(this);
}
