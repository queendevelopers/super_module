part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterButtonTapEvent extends RegisterEvent {
  final String? username;
  final String fullName;
  final String email;
  final String password;
  final String phone;

  RegisterButtonTapEvent(
      {this.username,
      required this.fullName,
      required this.email,
      required this.password,
      required this.phone});
}

class CheckUserNameAvailability extends RegisterEvent {
  final String username;

  CheckUserNameAvailability({required this.username});
}
