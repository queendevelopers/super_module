part of 'verify_otp_bloc.dart';

@immutable
abstract class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpLoadFailure extends VerifyOtpState {
  final String errorMessage;

  VerifyOtpLoadFailure({this.errorMessage});
}

class VerifyOtpSuccess extends VerifyOtpState {
  final String message;
  final String token;

  VerifyOtpSuccess({
    @required this.message,
    this.token,
  });
}

class GetOtpSending extends VerifyOtpState {}

class GetOtpFailure extends VerifyOtpState {
  final String message;

  GetOtpFailure(this.message);
}

class GetOtpSuccess extends VerifyOtpState {
  final String message;

  GetOtpSuccess(this.message);
}
