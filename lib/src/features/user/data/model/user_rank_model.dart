import 'package:super_module/super_module.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_rank_model.g.dart';

@JsonSerializable()
class UserRankModel {
  final int rank;
  final UserModel user;

  UserRankModel(this.rank, this.user);

  factory UserRankModel.fromJson(Map<String, dynamic> json) =>
      _$UserRankModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserRankModelToJson(this);
}
