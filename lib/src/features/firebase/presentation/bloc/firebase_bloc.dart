import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/firebase/data/models/firebase_notification.dart';
import 'package:super_module/src/features/firebase/data/models/firebase_remote_config_model.dart';
import 'package:super_module/src/features/firebase/domain/controller/firebase_controller.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';

@injectable
class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  final IFirebaseController controller;

  FirebaseBloc(this.controller) : super(FirebaseInitial()) {
    on<FirebaseRemoteConfigFetchEvent>((event, emit) async {
      emit(FirebaseRemoteConfigFetching());
      final response = await controller.getFirebaseRemoteConfig();
      emit(FirebaseRemoteConfigFetchSuccess(response));
    });

    on<FirebaseFetchFcmTokenEvent>((event, emit) async {
      emit(FirebaseFetchFcmTokenLoadingState());
      final token = await controller.getFcmToken();
      if (token != null) {
        emit(FirebaseFetchFcmTokenSuccessState(token));
      }
    });

    on<FirebaseListenFcmTokenChangeEvent>((event, emit) {
      _listenFcmTokenChangedEvent();
    });
    on<FirebaseFcmTokenChanged>(
        (event, emit) => FirebaseFcmTokenRefreshState(event.token));

    on<FirebaseFetchInitialNotificationEvent>((event, emit) async {
      final notification = await controller.getInitialNotification();
      if (notification != null)
        emit(FirebaseInitialNotificationFetchSuccessState(notification));
    });

    on<FirebaseListenNotificationEvent>((event, emit) {
      _listenNotification();
    });
    on<FirebaseNewNotificationReceivedEvent>((event, emit) =>
        emit(FirebaseNewNotificationState(event.notification)));
  }

  void _listenNotification() {
    controller.listenNotifications().listen((event) {
      add(FirebaseNewNotificationReceivedEvent(
          FirebaseNotification.fromRemoteNotification(event)));
    });
  }

  void _listenFcmTokenChangedEvent() {
    controller.onFcmTokenRefresh().listen((event) {
      add(FirebaseFcmTokenChanged(event));
    });
  }
}
