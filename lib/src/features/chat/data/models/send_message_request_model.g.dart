// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageRequestModel _$SendMessageRequestModelFromJson(
    Map<String, dynamic> json) {
  return SendMessageRequestModel(
    UserModel.fromJson(json['sender'] as Map<String, dynamic>),
    UserModel.fromJson(json['receiver'] as Map<String, dynamic>),
    json['msg'] as String,
  );
}

Map<String, dynamic> _$SendMessageRequestModelToJson(
        SendMessageRequestModel instance) =>
    <String, dynamic>{
      'sender': instance.sender.toJson(),
      'receiver': instance.receiver.toJson(),
      'msg': instance.msg,
    };
