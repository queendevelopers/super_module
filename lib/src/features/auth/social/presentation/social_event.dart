part of 'social_bloc.dart';

@immutable
abstract class SocialEvent {}

class SocialLoginTapEvent extends SocialEvent {
  final SocialType socialType;

  SocialLoginTapEvent({required this.socialType});
}
