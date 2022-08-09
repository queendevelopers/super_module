import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:super_module/src/features/firebase/data/models/firebase_notification.dart';
import 'package:super_module/src/features/firebase/data/models/firebase_remote_config_model.dart';

abstract class IFirebaseRepository {
  Future<FirebaseRemoteConfigModel> getFirebaseRemoteConfig();
  Future<String?> getFcmToken();
  Stream<String> onFcmTokenRefresh();

  ///retrive notification after app open from closed state
  Future<FirebaseNotification?> getInitialNotification();
  Stream<RemoteMessage> listenNotifications();
  Future<FlutterLocalNotificationsPlugin> initializeLocalNotification(
      {bool alert = true,
      bool announcement = false,
      bool badge = true,
      bool carPlay = false,
      bool criticalAlert = false,
      bool provisional = false,
      bool sound = true,
      void Function(String?)? onSelected,
      String androidNotificationIcon = '@mipmap/ic_launcher'});
  Future<void> showNotification(FirebaseNotification notification,
      void Function(dynamic payload) onNotificationClicked,
      {FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin});
}
