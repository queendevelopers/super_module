import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_valuation_point.g.dart';

@JsonSerializable()
class CompanyValuationPoint {
  @JsonKey(name: '_id')
  final String id;
  final String classroomContent;
  final double valuationPoint;

  const CompanyValuationPoint({
    required this.id,
    required this.classroomContent,
    required this.valuationPoint,
  });

  @override
  String toString() {
    return 'CompanyValuationPoint(id: $id, classroomContent: $classroomContent, valuationPoint: $valuationPoint)';
  }

  factory CompanyValuationPoint.fromJson(Map<String, dynamic> json) {
    return _$CompanyValuationPointFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompanyValuationPointToJson(this);

  CompanyValuationPoint copyWith({
    String? id,
    String? classroomContent,
    double? valuationPoint,
  }) {
    return CompanyValuationPoint(
      id: id ?? this.id,
      classroomContent: classroomContent ?? this.classroomContent,
      valuationPoint: valuationPoint ?? this.valuationPoint,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CompanyValuationPoint) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^ classroomContent.hashCode ^ valuationPoint.hashCode;
}
