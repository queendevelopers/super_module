import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/features/user/data/model/pagination_model.dart';

part 'user_rank_response_model.g.dart';

@JsonSerializable()
class UserRankResponseModel {
  final bool ok;
  final PaginationModel data;

  UserRankResponseModel(this.ok, this.data);

  factory UserRankResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserRankResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserRankResponseModelToJson(this);
}
