import 'package:json_annotation/json_annotation.dart';

part 'growth_trend.g.dart';

@JsonSerializable()
class GrowthTrend {
  @JsonKey(name: '_id')
  final String id;
  final double cashGrowth;
  final int companyBudgetGrowth;
  final double companyReputationGrowth;
  final double employNumberGrowth;
  final double employSatisfactionGrowth;

  const GrowthTrend({
    required this.id,
    required this.cashGrowth,
    required this.companyBudgetGrowth,
    required this.companyReputationGrowth,
    required this.employNumberGrowth,
    required this.employSatisfactionGrowth,
  });

  @override
  String toString() {
    return 'GrowthTrend(id: $id, cashGrowth: $cashGrowth, companyBudgetGrowth: $companyBudgetGrowth, companyReputationGrowth: $companyReputationGrowth, employNumberGrowth: $employNumberGrowth, employSatisfactionGrowth: $employSatisfactionGrowth)';
  }

  factory GrowthTrend.fromJson(Map<String, dynamic> json) {
    return _$GrowthTrendFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GrowthTrendToJson(this);

  GrowthTrend copyWith({
    String? id,
    double? cashGrowth,
    int? companyBudgetGrowth,
    double? companyReputationGrowth,
    double? employNumberGrowth,
    double? employSatisfactionGrowth,
  }) {
    return GrowthTrend(
      id: id ?? this.id,
      cashGrowth: cashGrowth ?? this.cashGrowth,
      companyBudgetGrowth: companyBudgetGrowth ?? this.companyBudgetGrowth,
      companyReputationGrowth:
          companyReputationGrowth ?? this.companyReputationGrowth,
      employNumberGrowth: employNumberGrowth ?? this.employNumberGrowth,
      employSatisfactionGrowth:
          employSatisfactionGrowth ?? this.employSatisfactionGrowth,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^
      cashGrowth.hashCode ^
      companyBudgetGrowth.hashCode ^
      companyReputationGrowth.hashCode ^
      employNumberGrowth.hashCode ^
      employSatisfactionGrowth.hashCode;
}
