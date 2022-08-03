import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/remote_config/data/models/firebase_remote_config_model.dart';
import 'package:super_module/src/features/remote_config/domain/controller/firebase_controller.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';

@injectable
class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  final IFirebaseController controller;

  FirebaseBloc(this.controller) : super(FirebaseInitial()) {
    on<FirebaseEvent>((event, emit) async {
      if (event is FirebaseRemoteConfigFetchEvent) {
        emit(FirebaseRemoteConfigFetching());
        final response = await controller.getFirebaseRemoteConfig();
        emit(FirebaseRemoteConfigFetchSuccess(response));
      }
    });
  }
}
