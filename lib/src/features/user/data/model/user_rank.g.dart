// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRank _$UserRankFromJson(Map<String, dynamic> json) => UserRank(
      json['id'] as String,
      json['rank'] as int,
      json['name'] as String,
      json['subTitle'] as String,
      json['totalShots'] as int,
      json['imageUrl'] as String,
    );

Map<String, dynamic> _$UserRankToJson(UserRank instance) => <String, dynamic>{
      'id': instance.id,
      'rank': instance.rank,
      'name': instance.name,
      'subTitle': instance.subTitle,
      'totalShots': instance.totalShots,
      'imageUrl': instance.imageUrl,
    };