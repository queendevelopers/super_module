import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/firebase/data/models/firebase_remote_config_model.dart';
import 'package:super_module/src/features/firebase/domain/repositories/i_firebase_repository.dart';

import '../../data/models/firebase_notification.dart';

abstract class IFirebaseController {
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
      String androidNotificationIcon = '@mipmap/launcher_icon'});
  Future<void> showNotification(FirebaseNotification notification,
      void Function(dynamic payload) onNotificationClicked,
      {FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin});
}

@Injectable(as: IFirebaseController)
class FirebaseController implements IFirebaseController {
  final IFirebaseRepository repository;

  FirebaseController(this.repository);

  @override
  Future<FirebaseRemoteConfigModel> getFirebaseRemoteConfig() async {
    return await repository.getFirebaseRemoteConfig();
  }

  @override
  Future<String?> getFcmToken() {
    return repository.getFcmToken();
  }

  @override
  Future<FirebaseNotification?> getInitialNotification() {
    return repository.getInitialNotification();
  }

  @override
  Stream<RemoteMessage> listenNotifications() {
    return repository.listenNotifications();
  }

  @override
  Stream<String> onFcmTokenRefresh() {
    return repository.onFcmTokenRefresh();
  }



  @override
  Future<void> showNotification(FirebaseNotification notification,
      void Function(dynamic payload) onNotificationClicked,
      {FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin}) {
    return repository.showNotification(notification, onNotificationClicked,
        flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin);
  }
  
  @override
  Future<FlutterLocalNotificationsPlugin> initializeLocalNotification({bool alert = true, bool announcement = false, bool badge = true, bool carPlay = false, bool criticalAlert = false, bool provisional = false, bool sound = true, void Function(String? p1)? onSelected, String androidNotificationIcon = '@mipmap/launcher_icon'}) {
    return repository.initializeLocalNotification(
        alert: alert,
        announcement: announcement,
        badge: badge,
        carPlay: carPlay,
        criticalAlert: criticalAlert,
        provisional: provisional,
        androidNotificationIcon: androidNotificationIcon,
        sound: sound,
        onSelected: onSelected);
  }
}
