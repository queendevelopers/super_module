import 'package:json_annotation/json_annotation.dart';

part 'current_location.g.dart';

@JsonSerializable()
class CurrentLocation {
  final String lat;
  final String lng;

  CurrentLocation(this.lat, this.lng);

  factory CurrentLocation.fromJson(Map<String, dynamic> json) =>
      _$CurrentLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentLocationToJson(this);
}
