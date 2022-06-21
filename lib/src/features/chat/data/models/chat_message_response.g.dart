// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageResponse _$ChatMessageResponseFromJson(Map<String, dynamic> json) =>
    ChatMessageResponse(
      CurrentLoggedUser.fromJson(
          json['currentlyLoggedUser'] as Map<String, dynamic>),
      json['msg'] as String,
    );

Map<String, dynamic> _$ChatMessageResponseToJson(
        ChatMessageResponse instance) =>
    <String, dynamic>{
      'currentlyLoggedUser': instance.currentlyLoggedUser,
      'msg': instance.msg,
    };
