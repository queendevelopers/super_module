import 'package:json_annotation/json_annotation.dart';

part 'title_model.g.dart';

@JsonSerializable()
class TitleModel {
  final Map<String, dynamic> forceTitleText;
  final Map<String, dynamic> titleText;

  TitleModel(this.forceTitleText, this.titleText);

  factory TitleModel.fromJson(Map<String, dynamic> json) =>
      _$TitleModelFromJson(json);

  Map<String, dynamic> toJson() => _$TitleModelToJson(this);
}
