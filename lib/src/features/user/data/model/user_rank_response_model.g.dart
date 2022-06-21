// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rank_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRankResponseModel _$UserRankResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserRankResponseModel(
      json['ok'] as bool,
      PaginationModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserRankResponseModelToJson(
        UserRankResponseModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'data': instance.data,
    };
