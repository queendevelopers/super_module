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
