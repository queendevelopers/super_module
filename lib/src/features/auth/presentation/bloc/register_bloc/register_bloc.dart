import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/auth/data/models/global_response_model.dart';
import 'package:super_module/src/features/auth/data/models/login_model.dart';
import 'package:super_module/src/features/auth/domain/controller/auth_login_controller.dart';
import 'package:super_module/src/features/user/data/session/i_session_manager.dart';

part 'register_event.dart';
part 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IAuthLoginController controller;
  final ISessionManager sessionManager;

  RegisterBloc(this.controller, this.sessionManager)
      : super(RegisterInitialState());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterButtonTapEvent) {
      yield RegisterLoadingState();
      final response = await controller.registerUser(
          username: event.username,
          name: event.fullName,
          email: event.email,
          password: event.password,
          phone: event.phone,
          address: event.address,
          role: event.role,
          subRole: event.subRole,
          panel: event.panel,
          schoolId: event.schoolId);
      if (response.ok) {
        if (response.user != null) {
          await sessionManager.saveCurrentUser(user: response.user!);
        }
        if (response.accessToken != null) {
          await sessionManager.saveToken(accessToken: response.accessToken!);
        }
         if (response.refreshToken != null) {
          await sessionManager.saveRefreshToken(
              refreshToken: response.refreshToken);
        }
        

          
        }
       
        yield RegisterSuccessState(response);
        return;
      }
      yield RegisterFailureState(errorMessage: response.message!);
    } else if (event is CheckUserNameAvailability) {
      yield UsernameCheckingState();
      final response = await controller.checkUsername(username: event.username);
      if (response.ok) {
        yield UsernameCheckSuccessState(response);
        return;
      }
      yield UsernameCheckFailureState(response);
    }
  }
}
