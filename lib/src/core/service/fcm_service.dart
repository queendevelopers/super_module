import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotificationService {
  final FirebaseMessaging fcm = FirebaseMessaging.instance;
  late String fcmToken;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future initialise(
      {alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
      String androidNotificationIcon = '@mipmap/ic_launcher'}) async {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings(androidNotificationIcon);
    var iOS = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: (value) {});
    // if (Platform.isIOS) {
    fcm.requestPermission(
        alert: alert,
        announcement: announcement,
        badge: badge,
        carPlay: carPlay,
        criticalAlert: criticalAlert,
        provisional: provisional,
        sound: sound);
    // }

    String? token = await fcm.getToken();
    print("FirebaseMessaging token: $token");
    fcmToken = token!;
  }

  /*
  You can use this function in UI in your own project way.
  App can only customize the foreground push notification. Background are auto handled by Firebase.
  Default styled can be used like below.
   */
  listenToNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      showNotification(message.data);
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  showNotification(Map<String, dynamic> message) async {
    var android = new AndroidNotificationDetails('channel id', 'channel NAME',
        priority: Priority.high, importance: Importance.max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        0,
        message['notification']['title'],
        message['notification']['body'],
        platform,
        payload: 'AndroidCoding.in');
  }
}
