part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserRankFetching extends UserState {}

class UserRankFetchFailure extends UserState {
  final String errorMessage;

  UserRankFetchFailure({required this.errorMessage});
}
class UserRankFetchSuccess extends UserState {
  final List<UserRankModel> userRankList;

  UserRankFetchSuccess({required this.userRankList});
}

class UserInformationUpdating extends UserState {}

class UserInformationUpdateFailure extends UserState {
  final String message;

  UserInformationUpdateFailure({required this.message});
}

class UserInformationUpdateSuccess extends UserState {
  final String? phone;

  UserInformationUpdateSuccess({this.phone});
}
