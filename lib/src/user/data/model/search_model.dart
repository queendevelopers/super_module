import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/auth/data/models/user_model.dart';

part 'search_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchModel {
  final bool ok;
  final List<UserModel> data;

  SearchModel(this.ok, this.data);

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}
