part of 'reset_password_bloc.dart';

@immutable
abstract class ResetPasswordEvent {}

class ResetPasswordButtonTapEvent extends ResetPasswordEvent {
  final String phone;

  ResetPasswordButtonTapEvent({required this.phone});
}

class ResetPasswordEmailButtonTapEvent extends ResetPasswordEvent {
  final ForgotPasswordPinVerificationRequestModel model;

  ResetPasswordEmailButtonTapEvent({required this.model});
}
