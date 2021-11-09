part of 'social_bloc.dart';

@immutable
abstract class SocialEvent {}

class SocialLoginTapEvent extends SocialEvent {
  final String type;

  SocialLoginTapEvent({required this.type});
}
