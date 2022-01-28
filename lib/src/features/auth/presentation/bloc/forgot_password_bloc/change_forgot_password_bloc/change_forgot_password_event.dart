part of 'change_forgot_password_bloc.dart';

@immutable
abstract class ChangeForgotPasswordEvent {}

class ChangeForgotPasswordButtonTapEvent extends ChangeForgotPasswordEvent {
  final String oldPassword;
  final String newPassword;
  final String token;

  ChangeForgotPasswordButtonTapEvent(
      {required this.oldPassword,
      required this.newPassword,
      required this.token});
}
