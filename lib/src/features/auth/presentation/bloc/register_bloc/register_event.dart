part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterButtonTapEvent extends RegisterEvent {
  final String? username;
  final String? fullName;
  final String? email;
  final String password;
  final String? phone;
  final String? address;
  final String? role;
  final String? subRole;
  final String? schoolId;
  final String? panel;

  RegisterButtonTapEvent({
    this.username,
    this.fullName,
     this.email,
    required this.password,
    this.address,
     this.phone,
    this.role,
    this.subRole,
    this.schoolId,
    this.panel,
  });
}

class CheckUserNameAvailability extends RegisterEvent {
  final String username;

  CheckUserNameAvailability({required this.username});
}
