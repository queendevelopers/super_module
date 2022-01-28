import 'package:json_annotation/json_annotation.dart';

part 'user_rank_model.g.dart';

@JsonSerializable()
class UserRankModel {
  final String id;
  final int rank;
  final String name;
  final String subTitle;
  final int totalShots;
  final String imageUrl;

  UserRankModel(this.id, this.rank, this.name, this.subTitle, this.totalShots,
      this.imageUrl);

  factory UserRankModel.fromJson(Map<String, dynamic> json) =>
      _$UserRankModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserRankModelToJson(this);
}
