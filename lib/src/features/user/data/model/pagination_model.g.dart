// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      PageLimitModel.fromJson(json['next'] as Map<String, dynamic>),
      PageLimitModel.fromJson(json['previous'] as Map<String, dynamic>),
      json['total'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => UserRankModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'next': instance.next.toJson(),
      'previous': instance.previous.toJson(),
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };