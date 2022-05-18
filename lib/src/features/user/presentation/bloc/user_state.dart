part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserInformationUpdating extends UserState {}

class UserInformationUpdateFailure extends UserState {
  final String message;

  UserInformationUpdateFailure({required this.message});
}

class UserInformationUpdateSuccess extends UserState {
  final String? phone;

  UserInformationUpdateSuccess({this.phone});
}

class UserProfileLoading extends UserState {}

class UserProfileLoadFailure extends UserState {
  final String message;

  UserProfileLoadFailure({required this.message});
}

class UserProfileLoadSuccess extends UserState {
  final UserModel user;

  UserProfileLoadSuccess({required this.user});
}
