part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginButtonTapEvent extends LoginEvent {
  final String email;
  final String password;

  LoginButtonTapEvent({required this.email, required this.password});
}

class LoginWithFaceBookTapEvent extends LoginEvent {}

class LoginWithGoogleTapEvent extends LoginEvent {}
