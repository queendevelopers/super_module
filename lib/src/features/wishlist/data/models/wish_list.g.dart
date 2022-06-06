// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishList _$WishListFromJson(Map<String, dynamic> json) {
  return WishList(
    json['_id'] as String,
    json['products'] as List<dynamic>,
  );
}

Map<String, dynamic> _$WishListToJson(WishList instance) => <String, dynamic>{
      '_id': instance.id,
      'products': instance.products,
    };
