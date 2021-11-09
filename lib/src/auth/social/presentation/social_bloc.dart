import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_module/src/auth/data/models/social/social_model.dart';
import 'package:super_module/src/auth/social/data/repository/i_social_repository.dart';
import 'package:super_module/super_module.dart';

part 'social_event.dart';
part 'social_state.dart';

@injectable
class SocialBloc extends Bloc<SocialEvent, SocialState> {
  static const String facebookType = 'facebook';
  static const String googleType = 'google';
  static const String appleType = 'apple';
  SocialModel? socialModel;
  final ISocialAuthRepository? socialAuthRepository;
  final ISessionManager? iSessionManager;
  SocialBloc(this.socialAuthRepository, this.iSessionManager)
      : super(SocialInitial());

  @override
  Stream<SocialState> mapEventToState(
    SocialEvent event,
  ) async* {
    if (event is SocialLoginTapEvent) {
      yield SocialStateLoading();
      switch (event.type) {
        case facebookType:
          socialModel = await socialAuthRepository?.facebookLogin();
          break;
        case googleType:
          socialModel = await socialAuthRepository?.googleLoginIn();
          break;
        case appleType:
          socialModel = await socialAuthRepository?.appleLogin();
          break;
      }
      if (socialModel != null && socialModel!.ok) {
        await iSessionManager?.saveToken(accessToken: socialModel!.accessToken!);
        await iSessionManager?.saveCurrentUser(user: socialModel?.user);
        yield SocialStateSuccess(socialModel: socialModel!);
        return;
      }
      yield SocialStateFailed(
          message: socialModel?.message ?? 'An unknown error occured');
    }
  }
}
// mixin FaceBookType on Bloc<SocialEvent,SocialState>{}
// mixin GoogleType on Bloc<SocialEvent,SocialState>{}
// mixin AppleType on Bloc<SocialEvent,SocialState>{}
