import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/firebase/data/models/firebase_notification.dart';
import 'package:super_module/src/features/firebase/data/models/firebase_remote_config_model.dart';

import '../../domain/repositories/i_firebase_repository.dart';

@Injectable(as: IFirebaseRepository)
class FirebaseRepository implements IFirebaseRepository {
  late final FirebaseMessaging message;
  FirebaseRepository() : message = FirebaseMessaging.instance;
  @override
  Future<FirebaseRemoteConfigModel> getFirebaseRemoteConfig() async {
    try {
      //Get Latest version info from firebase config
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      // Using default duration to force fetching from remote server.
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(seconds: 0)));
      await remoteConfig.fetch();
      await remoteConfig.fetchAndActivate();
      final data = remoteConfig.getAll()['version_information'];
      return FirebaseRemoteConfigModel.fromJson(
          jsonDecode(data?.asString() ?? ''));
    } catch (exception) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');
      rethrow;
    }
  }

  @override
  Future<String?> getFcmToken() {
    return message.getToken();
  }

  @override
  Future<FirebaseNotification?> getInitialNotification() async {
    final notification = await message.getInitialMessage();
    if (notification != null) {
      return FirebaseNotification.fromRemoteNotification(notification);
    }
    return null;
  }

  @override
  Stream<RemoteMessage> listenNotifications() {
    return FirebaseMessaging.onMessage;
  }

  @override
  Stream<String> onFcmTokenRefresh() {
    return message.onTokenRefresh;
  }

  @override
  Future<FlutterLocalNotificationsPlugin> initializeLocalNotification(
      {alert: true,
      bool announcement = false,
      bool badge = true,
      bool carPlay = false,
      bool criticalAlert = false,
      bool provisional = false,
      void Function(String?)? onSelected,
      sound: true,
      String androidNotificationIcon = '@mipmap/ic_launcher'}) async {
    var flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings(androidNotificationIcon);
    var iOS = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: (value) {});
    await FirebaseMessaging.instance.requestPermission(
        alert: alert,
        announcement: announcement,
        badge: badge,
        carPlay: carPlay,
        criticalAlert: criticalAlert,
        provisional: provisional,
        sound: sound);
    return flutterLocalNotificationsPlugin;
  }

  @override
  Future<void> showNotification(FirebaseNotification notification,
      void Function(dynamic payload) onNotificationClicked,
      {FlutterLocalNotificationsPlugin?
          flutterLocalNotificationsPlugin}) async {
    var android = new AndroidNotificationDetails('channel id', 'channel NAME',
        priority: Priority.high, importance: Importance.max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    final flutterLocalNotifications = flutterLocalNotificationsPlugin ??
        await initializeLocalNotification(onSelected: onNotificationClicked);
    await flutterLocalNotifications.show(
        0, notification.title, notification.body, platform,
        payload: jsonEncode((notification.payload ?? {})));
  }
}