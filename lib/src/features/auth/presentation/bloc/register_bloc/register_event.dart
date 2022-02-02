part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterButtonTapEvent extends RegisterEvent {
  final String? username;
  final String? fullName;
  final String email;
  final String password;
  final String phone;
  final String? address;

  RegisterButtonTapEvent({
    this.username,
    this.fullName,
    required this.email,
    required this.password,
    this.address,
    required this.phone,
  });
}

class CheckUserNameAvailability extends RegisterEvent {
  final String username;

  CheckUserNameAvailability({required this.username});
}
