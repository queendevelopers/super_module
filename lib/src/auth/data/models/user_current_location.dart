import 'package:json_annotation/json_annotation.dart';

import 'current_location.dart';

part 'user_current_location.g.dart';

@JsonSerializable(explicitToJson: true)
class UserCurrentLocation {
  final CurrentLocation currentLocation;

  UserCurrentLocation(this.currentLocation);

  factory UserCurrentLocation.fromJson(Map<String, dynamic> json) =>
      _$UserCurrentLocationFromJson(json);

  Map<String, dynamic> toJson() => _$UserCurrentLocationToJson(this);
}
