part of 'reset_password_bloc.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordLoadFailure extends ResetPasswordState {
  final String errorMessage;

  ResetPasswordLoadFailure({this.errorMessage});
}

class ResetPasswordLoadSuccess extends ResetPasswordState {
  final ForgotPasswordPinVerificationResponseModel model;

  ResetPasswordLoadSuccess(this.model);
}
