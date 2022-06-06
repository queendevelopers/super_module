// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_limit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageLimitModel _$PageLimitModelFromJson(Map<String, dynamic> json) {
  return PageLimitModel(
    json['page'] as int,
    json['limit'] as int,
  );
}

Map<String, dynamic> _$PageLimitModelToJson(PageLimitModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
