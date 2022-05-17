import 'package:json_annotation/json_annotation.dart';

part 'wish_list.g.dart';

@JsonSerializable(explicitToJson: true)
class WishList {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String description;
  final int price;
  final List<dynamic> products;

  WishList(this.id, this.products, this.name, this.description, this.price);

  factory WishList.fromJson(Map<String, dynamic> json) =>
      _$WishListFromJson(json);

  Map<String, dynamic> toJson() => _$WishListToJson(this);
}
