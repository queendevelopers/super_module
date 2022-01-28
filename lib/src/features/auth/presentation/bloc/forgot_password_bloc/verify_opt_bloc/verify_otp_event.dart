part of 'verify_otp_bloc.dart';

@immutable
abstract class VerifyOtpEvent {}

class VerifyOtpButtonTapEvent extends VerifyOtpEvent {
  final int otpCode;
  final bool navigateToHome;
  final String key;

  VerifyOtpButtonTapEvent(
      {required this.otpCode, required this.navigateToHome, required this.key});
}

class GetOtpEvent extends VerifyOtpEvent {
  final String? token;

  GetOtpEvent({this.token});
}
