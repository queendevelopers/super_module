part of 'social_bloc.dart';

@immutable
abstract class SocialState {}

class SocialInitial extends SocialState {}

class SocialStateLoading extends SocialState {}

class SocialStateFailed extends SocialState {
  final String message;

  SocialStateFailed({@required this.message});
}

class SocialStateSuccess extends SocialState {
  final SocialModel socialModel;

  SocialStateSuccess({@required this.socialModel});
}
