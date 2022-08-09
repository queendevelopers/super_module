import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:json_annotation/json_annotation.dart';

part 'firebase_notification.g.dart';

@JsonSerializable()
class FirebaseNotification {
  final String? title;
  final String? body;
  final String? largeImage;
  final Map<dynamic, dynamic>? payload;

  FirebaseNotification({this.title, this.body, this.largeImage, this.payload});

  factory FirebaseNotification.fromRemoteNotification(RemoteMessage message) {
    return FirebaseNotification(
      title: message.notification?.title,
      body: message.notification?.body,
      largeImage: Platform.isAndroid
          ? message.notification?.android?.imageUrl
          : message.notification?.apple?.imageUrl,
      payload: message.data,
    );
  }
}
