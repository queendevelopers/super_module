part of 'firebase_bloc.dart';

@immutable
abstract class FirebaseState {}

class FirebaseInitial extends FirebaseState {}

class FirebaseRemoteConfigFetching extends FirebaseState {}

class FirebaseRemoteConfigFetchFailure extends FirebaseState {
  final String message;

  FirebaseRemoteConfigFetchFailure(this.message);
}

class FirebaseRemoteConfigFetchSuccess extends FirebaseState {
  final FirebaseRemoteConfigModel model;

  FirebaseRemoteConfigFetchSuccess(this.model);
}

class FirebaseFetchFcmTokenLoadingState extends FirebaseState {}

class FirebaseFetchFcmTokenSuccessState extends FirebaseState {
  final String token;

  FirebaseFetchFcmTokenSuccessState(this.token);
}

class FirebaseFcmTokenRefreshState extends FirebaseState {
  final String newToken;

  FirebaseFcmTokenRefreshState(this.newToken);
}

class FirebaseNewNotificationState extends FirebaseState {
  final FirebaseNotification notification;

  FirebaseNewNotificationState(this.notification);
}

class FirebaseInitialNotificationFetchSuccessState extends FirebaseState {
  final FirebaseNotification notification;

  FirebaseInitialNotificationFetchSuccessState(this.notification);
}

class FirebaseNotificationClickedState extends FirebaseState {
  final Map<String, dynamic> payload;

  FirebaseNotificationClickedState(this.payload);
}
