import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:super_module/src/features/auth/data/models/social/social_model.dart';
import 'package:super_module/src/features/auth/domain/repositories/i_auth_remote_repository.dart';
import 'package:super_module/src/features/auth/social/data/repository/i_social_repository.dart';

@Injectable(as: ISocialAuthRepository)
class SocialAuthRepository implements ISocialAuthRepository {
  final IAuthRemoteRepository repository;

  SocialAuthRepository(this.repository);

  Future<SocialModel> appleLogin() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      SocialModel model =
          await repository.loginWithApple(token: credential.identityToken!);
      return model;
    } catch (e) {
      return SocialModel(ok: false, message: 'An Unknown Error occurred.');
    }
  }

  Future<SocialModel> facebookLogin() async {
    try{
      await FacebookAuth.instance.logOut();
    }catch(e){
      debugPrint('Facebook logout ${e.toString()}');
    }
    final LoginResult? result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile
    switch (result!.status) {
      case LoginStatus.success:
        final AccessToken? accessToken = result.accessToken;
        SocialModel model =
            await repository.loginWithFacebook(token: accessToken!.token);
        debugPrint(accessToken.expires.toString());
        return model;
      case LoginStatus.failed:
        return SocialModel(
            ok: false, message: result.message ?? 'An unknown error occurred.');

      default:
        return SocialModel(
            ok: false, message: result.message ?? 'An unknown error occurred.');
    }
  }

  Future<SocialModel> googleLoginIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    if(await googleSignIn.isSignedIn()){
      await googleSignIn.signOut();
    }
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      GoogleSignInAuthentication authentication =
          await googleSignInAccount!.authentication;
      final model =
          await repository.loginWithGoogle(token: authentication.accessToken!);
      debugPrint(authentication.accessToken);
      debugPrint(authentication.idToken);
      return model;
    } catch (e) {
      return SocialModel(ok: false, message: '${e.toString()}');
    }
  }
}
