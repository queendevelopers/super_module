import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/features/remote_config/data/models/submodel/button_model.dart';
import 'package:super_module/src/features/remote_config/data/models/submodel/description_model.dart';
import 'package:super_module/src/features/remote_config/data/models/submodel/redirect_model.dart';
import 'package:super_module/src/features/remote_config/data/models/submodel/title_model.dart';

part 'firebase_remote_config_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FirebaseRemoteConfigModel {
  final String latestVersion;
  final String minimumVersion;
  final TitleModel title;
  final DescriptionModel description;
  final ButtonModel button;
  final String releaseNotes;
  final bool isEnabled;
  final RedirectModel redirect;

  FirebaseRemoteConfigModel(
      this.latestVersion,
      this.minimumVersion,
      this.releaseNotes,
      this.isEnabled,
      this.title,
      this.description,
      this.button,
      this.redirect);

  factory FirebaseRemoteConfigModel.fromJson(Map<String, dynamic> json) =>
      _$FirebaseRemoteConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$FirebaseRemoteConfigModelToJson(this);
}
