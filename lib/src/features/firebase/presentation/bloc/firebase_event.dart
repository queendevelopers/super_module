part of 'firebase_bloc.dart';

@immutable
abstract class FirebaseEvent {}

class FirebaseRemoteConfigFetchEvent extends FirebaseEvent {}

class FirebaseFetchFcmTokenEvent extends FirebaseEvent {}

class FirebaseFetchInitialNotificationEvent extends FirebaseEvent {}

class FirebaseListenFcmTokenChangeEvent extends FirebaseEvent {}

class FirebaseFcmTokenChanged extends FirebaseEvent {
  final String token;

  FirebaseFcmTokenChanged(this.token);
}

class FirebaseListenNotificationEvent extends FirebaseEvent {}

class FirebaseNewNotificationReceivedEvent extends FirebaseEvent {
  final FirebaseNotification notification;

  FirebaseNewNotificationReceivedEvent(this.notification);
}

class FirebaseInitializeNotificationEvent extends FirebaseEvent {
  final bool alert;
  final bool announcement;
  final bool badge;
  final bool carPlay;
  final bool criticalAlert;
  final bool provisional;
  final bool sound;
  final String androidNotificationIcon;

  FirebaseInitializeNotificationEvent({
    this.alert = true,
    this.announcement = false,
    this.badge = true,
    this.carPlay = false,
    this.criticalAlert = false,
    this.provisional = false,
    this.sound = true,
    this.androidNotificationIcon = 'bell',
  });
}

class FirebaseNotificationClickedEvent extends FirebaseEvent {
  final FirebaseNotification notification;

  FirebaseNotificationClickedEvent(this.notification);
}

class FirebaseShowLocalNotificationEvent extends FirebaseEvent {
  final FirebaseNotification notification;

  FirebaseShowLocalNotificationEvent(this.notification);
}

class FirebaseOnNotificationClickedEvent extends FirebaseEvent {
  final Map<String, dynamic> payload;

  FirebaseOnNotificationClickedEvent(this.payload);
}
