import 'package:json_annotation/json_annotation.dart';

part 'description_model.g.dart';

@JsonSerializable()
class DescriptionModel {
  final Map<String, dynamic> forceDescriptionText;
  final Map<String, dynamic> descriptionText;

  DescriptionModel(this.forceDescriptionText, this.descriptionText);

  factory DescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$DescriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionModelToJson(this);
}
