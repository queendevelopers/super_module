import 'package:json_annotation/json_annotation.dart';

part 'cart_list.g.dart';

@JsonSerializable(explicitToJson: true)
class Cart {
  final String id;
  final int quantity;

  ///ToDo:Need to change to List<dynamic>
  final List<dynamic> product;

  Cart(this.id, this.product, this.quantity);

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
