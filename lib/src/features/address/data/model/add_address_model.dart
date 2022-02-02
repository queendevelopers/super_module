import 'package:json_annotation/json_annotation.dart';

part 'add_address_model.g.dart';

@JsonSerializable()
class AddAddressModel {
  final bool? ok;
  final String message;

  AddAddressModel(this.ok, this.message);

  factory AddAddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddAddressModelToJson(this);
}
