import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';
import 'package:super_module/src/features/user/data/session/i_session_manager.dart';
import 'package:super_module/src/features/user/domain/controller/user_controller.dart';

part 'user_event.dart';
part 'user_state.dart';

@Injectable()
class UserBloc extends Bloc<UserEvent, UserState> {
  final ISessionManager sessionManager;
  final IUserController controller;

  UserBloc(this.controller, this.sessionManager) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserProfileFetchEvent) {
      emit(UserProfileLoading());
      final localUser = await sessionManager.getCurrentUser();
      if (localUser != null) {
        emit(UserProfileLoadSuccess(user: localUser));
      }
      final response = await controller.getUserProfile();
      if (response.ok && response.response != null) {
        emit(UserProfileLoadSuccess(user: response.response!));
        return;
      }
      emit(UserProfileLoadFailure(
          message: response.message ?? 'An Unknown Error Occurred.'));
    }
    if (event is UserProfileUpdateEvent) {
      yield UserInformationUpdating();
      final result = await controller.userInformationUpdate(
          model: event.userModel, token: event.token);
      if (result.ok) {
        yield UserInformationUpdateSuccess(phone: result.data?.phone ?? '');
        return;
      }
      yield UserInformationUpdateFailure(
          message: result.message ?? 'An unknown error occurred.');
    }
  }
}
