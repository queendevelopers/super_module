import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseService {
  final FirebaseMessaging fcm = FirebaseMessaging.instance;
  late String fcmToken;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future initialise() async {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android: android, iOS: iOS);
    // flutterLocalNotificationsPlugin.initialize(initSetttings,
    //     onSelectNotification: onSelectNotification);
    // if (Platform.isIOS) {
    //   // fcm.requestNotificationPermissions(IosNotificationSettings());
    // }

    // If you want to test the push notification locally,
    // you need to get the token and input to the Firebase console
    // https://console.firebase.google.com/project/YOUR_PROJECT_ID/notification/compose
    String? token = await fcm.getToken();
    print("FirebaseMessaging token: $token");
    fcmToken = token!;

    // fcm.configure(onMessage: (Map<String, dynamic> message) async {
    //   print("onMessage: $message");
    //
    //   showNotification(message);
    //
    //   // Get.snackbar(message['notification']['title'], message['notification']['body']);
    //
    //   // if (Platform.isAndroid) {
    //   //   notificationMessage = PushNotificationMessage(
    //   //     title: message['notification']['title'],
    //   //     body: message['notification']['body'],
    //   //   );
    //   //
    //   //   var notify = json.decode(message['data']['payload'] ?? message);
    //   //   setvalue(notify);
    //   //   Get.snackbar(notificationMessage.title, notificationMessage.data.bookingTitle);
    //   // }
    // }, onLaunch: (Map<String, dynamic> message) async {
    //   print("onLaunch: $message");
    //   // navigatorkey.currentState.pushNamed("/login");
    // }, onResume: (Map<String, dynamic> message) async {
    //   print("onResume: $message");
    // });
    // onBackgroundMessage: myBackgroundMessageHandler);
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
