// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRankModel _$UserRankModelFromJson(Map<String, dynamic> json) =>
    UserRankModel(
      json['rank'] as int,
      UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserRankModelToJson(UserRankModel instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'user': instance.user,
    };
