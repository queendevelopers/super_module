import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/features/user/data/model/page_limit_model.dart';
import 'package:super_module/src/features/user/data/model/user_rank_model.dart';

part 'pagination_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PaginationModel {
  final PageLimitModel next;
  final PageLimitModel previous;
  final int total;
  final List<UserRankModel> data;

  PaginationModel(this.next, this.previous, this.total, this.data);

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}
