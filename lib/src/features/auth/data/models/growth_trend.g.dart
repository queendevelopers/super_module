// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'growth_trend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrowthTrend _$GrowthTrendFromJson(Map<String, dynamic> json) => GrowthTrend(
      id: json['_id'] as String,
      cashGrowth: (json['cashGrowth'] as num).toDouble(),
      companyBudgetGrowth: (json['companyBudgetGrowth'] as num).toDouble(),
      companyReputationGrowth:
          (json['companyReputationGrowth'] as num).toDouble(),
      employNumberGrowth: (json['employNumberGrowth'] as num).toDouble(),
      employSatisfactionGrowth:
          (json['employSatisfactionGrowth'] as num).toDouble(),
    );

Map<String, dynamic> _$GrowthTrendToJson(GrowthTrend instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'cashGrowth': instance.cashGrowth,
      'companyBudgetGrowth': instance.companyBudgetGrowth,
      'companyReputationGrowth': instance.companyReputationGrowth,
      'employNumberGrowth': instance.employNumberGrowth,
      'employSatisfactionGrowth': instance.employSatisfactionGrowth,
    };
