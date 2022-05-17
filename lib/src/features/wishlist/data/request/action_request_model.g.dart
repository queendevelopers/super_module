// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionRequestModel _$ActionRequestModelFromJson(Map<String, dynamic> json) =>
    ActionRequestModel(
      json['action'] as String,
      json['product'] as String,
    );

Map<String, dynamic> _$ActionRequestModelToJson(ActionRequestModel instance) =>
    <String, dynamic>{
      'action': instance.action,
      'product': instance.product,
    };
