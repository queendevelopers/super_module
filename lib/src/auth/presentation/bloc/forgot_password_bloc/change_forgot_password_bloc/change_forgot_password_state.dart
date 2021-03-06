part of 'change_forgot_password_bloc.dart';

@immutable
abstract class ChangeForgotPasswordState {}

class ChangeForgotPasswordInitial extends ChangeForgotPasswordState {}

class ChangeForgotPasswordLoading extends ChangeForgotPasswordState {}

class ChangeForgotPasswordLoadFailure extends ChangeForgotPasswordState {
  final String errorMessage;

  ChangeForgotPasswordLoadFailure({this.errorMessage});
}

class ChangeForgotPasswordLoadSuccess extends ChangeForgotPasswordState {
  final String message;

  ChangeForgotPasswordLoadSuccess({this.message});
}
