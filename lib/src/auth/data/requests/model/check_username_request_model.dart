import 'package:json_annotation/json_annotation.dart';
import 'package:rest_client/rest_client.dart';

part 'check_username_request_model.g.dart';

@JsonSerializable()
class CheckUsernameRequestModel extends BaseRequestModel {
  final String username;

  CheckUsernameRequestModel(this.username);

  factory CheckUsernameRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CheckUsernameRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckUsernameRequestModelToJson(this);
}
