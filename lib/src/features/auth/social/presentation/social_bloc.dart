import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_module/src/features/auth/data/models/social/social_model.dart';
import 'package:super_module/src/features/auth/social/data/repository/i_social_repository.dart';
import 'package:super_module/super_module.dart';

part 'social_event.dart';
part 'social_state.dart';

enum SocialType { Facebook, Google, Apple }

@injectable
class SocialBloc extends Bloc<SocialEvent, SocialState> {
  late SocialModel socialModel;
  final ISocialAuthRepository socialAuthRepository;
  final ISessionManager iSessionManager;

  SocialBloc(this.socialAuthRepository, this.iSessionManager)
      : super(SocialInitial());

  @override
  Stream<SocialState> mapEventToState(
    SocialEvent event,
  ) async* {
    if (event is SocialLoginTapEvent) {
      yield SocialStateLoading();
      switch (event.socialType) {
        case SocialType.Facebook:
          socialModel = await socialAuthRepository.facebookLogin();
          break;
        case SocialType.Google:
          socialModel = await socialAuthRepository.googleLoginIn();
          break;
        case SocialType.Apple:
          socialModel = await socialAuthRepository.appleLogin();
          break;
      }
      if (socialModel.ok) {
        await iSessionManager.saveToken(accessToken: socialModel.accessToken!);
        if (socialModel.user != null) {
          await iSessionManager.saveCurrentUser(user: socialModel.user!);
        }
        yield SocialStateSuccess(socialModel: socialModel);
        return;
      }
      yield SocialStateFailed(
          message: socialModel.message ?? 'An unknown error occured');
    }
  }
}
// mixin FaceBookType on Bloc<SocialEvent,SocialState>{}
// mixin GoogleType on Bloc<SocialEvent,SocialState>{}
// mixin AppleType on Bloc<SocialEvent,SocialState>{}
