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
