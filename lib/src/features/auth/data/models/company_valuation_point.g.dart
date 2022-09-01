// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_valuation_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyValuationPoint _$CompanyValuationPointFromJson(
        Map<String, dynamic> json) =>
    CompanyValuationPoint(
      id: json['_id'] as String,
      classroomContent: json['classroomContent'] as String,
      valuationPoint: (json['valuationPoint'] as num).toDouble(),
    );

Map<String, dynamic> _$CompanyValuationPointToJson(
        CompanyValuationPoint instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'classroomContent': instance.classroomContent,
      'valuationPoint': instance.valuationPoint,
    };
