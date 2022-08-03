import 'package:json_annotation/json_annotation.dart';

part 'button_model.g.dart';

@JsonSerializable()
class ButtonModel {
  final Map<String, dynamic> yesButtonText;
  final Map<String, dynamic> noButtonText;

  ButtonModel(this.yesButtonText, this.noButtonText);

  factory ButtonModel.fromJson(Map<String, dynamic> json) =>
      _$ButtonModelFromJson(json);

  Map<String, dynamic> toJson() => _$ButtonModelToJson(this);
}
