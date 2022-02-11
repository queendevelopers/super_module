import 'package:json_annotation/json_annotation.dart';

part 'page_limit_model.g.dart';

@JsonSerializable()
class PageLimitModel {
  final int page;
  final int limit;

  PageLimitModel(this.page, this.limit);

  factory PageLimitModel.fromJson(Map<String, dynamic> json) =>
      _$PageLimitModelFromJson(json);

  Map<String, dynamic> toJson() => _$PageLimitModelToJson(this);
}
