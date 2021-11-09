import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  final String city;
  final String state;
  final String county;
  final String suburb;
  final String country;
  final String postcode;
  final String pedestrian;
  final String country_code;
  final String city_district;

  AddressModel(this.city, this.state, this.country, this.suburb, this.postcode,
      this.pedestrian, this.country_code, this.city_district, this.county);

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
