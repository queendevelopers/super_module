import 'package:json_annotation/json_annotation.dart';

part 'chat_message_response.g.dart';

@JsonSerializable()
class ChatMessageResponse {
  @JsonKey(name: '_id')
  final String id;
  final String from;
  final String to;
  final String message;
  final DateTime createdAt;
  final DateTime updatedAt;

  ChatMessageResponse(this.id, this.from, this.to, this.message, this.createdAt,
      this.updatedAt);

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageResponseToJson(this);
}
