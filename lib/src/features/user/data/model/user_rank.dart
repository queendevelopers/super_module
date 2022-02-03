import 'package:json_annotation/json_annotation.dart';

part 'user_rank.g.dart';

@JsonSerializable()
class UserRank {
  final String id;
  final int rank;
  final String name;
  final String subTitle;
  final int totalShots;
  final String imageUrl;


  UserRank(this.id, this.rank, this.name, this.subTitle, this.totalShots,
      this.imageUrl);

  factory UserRank.fromJson(Map<String, dynamic> json) =>
      _$UserRankFromJson(json);

  Map<String, dynamic> toJson() => _$UserRankToJson(this);
}
