// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseNotification _$FirebaseNotificationFromJson(
        Map<String, dynamic> json) =>
    FirebaseNotification(
      title: json['title'] as String?,
      body: json['body'] as String?,
      largeImage: json['largeImage'] as String?,
      payload: json['payload'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$FirebaseNotificationToJson(
        FirebaseNotification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'largeImage': instance.largeImage,
      'payload': instance.payload,
    };
