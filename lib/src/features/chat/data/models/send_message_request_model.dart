import 'package:json_annotation/json_annotation.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';

part 'send_message_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SendMessageRequestModel {
  final UserModel sender;
  final UserModel receiver;
  final String msg;

  SendMessageRequestModel(this.sender, this.receiver, this.msg);

  factory SendMessageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SendMessageRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageRequestModelToJson(this);
}
