import 'package:super_module/src/features/auth/data/models/social/social_model.dart';

abstract class ISocialAuthRepository {
  Future<SocialModel> appleLogin();

  Future<SocialModel> facebookLogin();

  Future<SocialModel> googleLoginIn();
}
