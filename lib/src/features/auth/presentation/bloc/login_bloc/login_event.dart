part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginButtonTapEvent extends LoginEvent {
  final String? email;
  final String password;
  final String? phone;
  final String? role;

  LoginButtonTapEvent({ this.email, required this.password,this.phone,this.role});
}
