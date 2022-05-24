part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserProfileFetchEvent extends UserEvent {}

class UserProfileUpdateEvent extends UserEvent {
  final UserModel userModel;
  final String? token;

  UserProfileUpdateEvent(this.userModel, this.token);
}
