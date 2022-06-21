import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'register_phone_by_otp_event.dart';
part 'register_phone_by_otp_state.dart';

class RegisterPhoneByOtpBloc
    extends Bloc<RegisterPhoneByOtpEvent, RegisterPhoneByOtpState> {
  RegisterPhoneByOtpBloc() : super(RegisterPhoneByOtpInitial());

  @override
  Stream<RegisterPhoneByOtpState> mapEventToState(
    RegisterPhoneByOtpEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
