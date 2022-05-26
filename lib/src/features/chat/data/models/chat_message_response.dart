import 'package:json_annotation/json_annotation.dart';

import 'current_logged_user.dart';

part 'chat_message_response.g.dart';

@JsonSerializable()
class ChatMessageResponse {
  CurrentLoggedUser currentlyLoggedUser;
  final String msg;

  ChatMessageResponse(this.currentlyLoggedUser, this.msg);

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageResponseToJson(this);
}
