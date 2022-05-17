import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'action_request_model.g.dart';

@JsonSerializable()
class ActionRequestModel implements BaseRequestModel {
  final String action;
  final String product;

  ActionRequestModel(this.action, this.product);

  factory ActionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ActionRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActionRequestModelToJson(this);
}
