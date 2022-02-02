part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserRankFetchEvent extends UserEvent {}

class UserInformationUpdateEvent extends UserEvent {
  final UserModel userModel;
  final String? token;

  UserInformationUpdateEvent(this.userModel, this.token);
}
