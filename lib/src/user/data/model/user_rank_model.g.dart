// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRankModel _$UserRankModelFromJson(Map<String, dynamic> json) {
  return UserRankModel(
    json['id'] as String,
    json['rank'] as int,
    json['name'] as String,
    json['subTitle'] as String,
    json['totalShots'] as int,
    json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$UserRankModelToJson(UserRankModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rank': instance.rank,
      'name': instance.name,
      'subTitle': instance.subTitle,
      'totalShots': instance.totalShots,
      'imageUrl': instance.imageUrl,
    };
