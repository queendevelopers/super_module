// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishList _$WishListFromJson(Map<String, dynamic> json) => WishList(
      json['_id'] as String,
      json['products'] as List<dynamic>,
      json['name'] as String,
      json['description'] as String,
      json['price'] as int,
    );

Map<String, dynamic> _$WishListToJson(WishList instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'products': instance.products,
    };
