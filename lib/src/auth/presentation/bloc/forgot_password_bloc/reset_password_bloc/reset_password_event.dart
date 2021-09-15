part of 'reset_password_bloc.dart';

@immutable
abstract class ResetPasswordEvent {}

class ResetPasswordButtonTapEvent extends ResetPasswordEvent {
  final String phone;

  ResetPasswordButtonTapEvent({@required this.phone});
}
