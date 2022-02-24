import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:super_module/src/features/auth/biometric/encryption/rsa_util.dart';
import 'package:super_module/src/features/auth/domain/controller/auth_login_controller.dart';
import 'package:super_module/src/features/auth/domain/repositories/i_auth_remote_repository.dart';
import 'package:super_module/src/features/user/data/session/i_app_manager.dart';
import 'package:super_module/src/features/user/data/session/i_session_manager.dart';

import '../../../../../super_module.dart';

part 'biometric_event.dart';
part 'biometric_state.dart';

mixin BiometricActionBloc implements BiometricBloc {}

@injectable
class BiometricBloc extends Bloc<BiometricEvent, BiometricState> {
  final LocalAuthentication? auth = LocalAuthentication();
  final IAuthRemoteRepository repository;
  final IAuthLoginController controller;
  final IAppManager appManager;
  final ISessionManager sessionManager;

  BiometricBloc(
      this.repository, this.sessionManager, this.controller, this.appManager)
      : super(BiometricInitial());

  @override
  Stream<BiometricState> mapEventToState(
    BiometricEvent event,
  ) async* {
    if (event is HasBiometricAuthenticationEvent) {
      yield BiometricAuthenticationFetching();
      bool? canCheckBiometrics = await auth?.canCheckBiometrics;
      if (canCheckBiometrics != null) {
        yield BiometricAuthenticationFetchSuccess(
            hasBiometric: canCheckBiometrics);
      }
    } else if (event is GetAllAvailableBiometricsEvent) {
      yield AllAvailableBiometricsFetching();
      try {
        final availableBiometrics = await auth?.getAvailableBiometrics();
        yield AllAvailableBiometricsFetchSuccess(availableBiometrics!);
      } on PlatformException catch (e) {
        debugPrint(e.toString());
        yield AllAvailableBiometricsFetchFailure();
      }
    } else if (event is AuthenticateWithBiometricEvent) {
      yield AuthenticateWithBiometricFetching();
      final local = await sessionManager.readBiometricInfo();
      // debugPrint('${local.id}');
      // RSAUtils rsaUtils =
      //     RSAUtils.getInstance(local.publickey, local.privateKey);
      // final encKey = rsaUtils.encryptByPrivateKey(base64Decode(local.encKey));
      // final encodedData = base64Encode(encKey);
      // debugPrint('Encoded String $encodedData');

      // Uint8List sstr = utf8.encode(local!.encKey!) as Uint8List;
      // byte[] publicBytes = Base64.decodeBase64(publicK);
      // X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicBytes);
      // KeyFactory keyFactory = KeyFactory.getInstance("RSA");
      // PublicKey pubKey = keyFactory.generatePublic(keySpec);

      var privateKey = parse(local!.privateKey!);
      var publicKey = parse(local!.publickey!);
      print(privateKey.toString());
      Uint8List sstr = utf8.encode(local.encKey!) as Uint8List;

      final enstr = encryptByPrivateKey(
        sstr,
        publicKey as RSAPublicKey,
        privateKey as RSAPrivateKey,
      );
      if (enstr != null) {
        final encKey = base64Encode(enstr);
        print(local.publickey);
        print(local.privateKey);

        final response = await repository.authenticateWithBiometrics(
            BiometricRegisterModel(
                id: local.id, encKey: encKey, deviceId: local.deviceId));

        if (response.ok) {
          final utf8List = decryptByPrivateKey(
              (base64.decode(response.data.encryptedAccessToken)),
              local.publickey as RSAPublicKey,
              local.privateKey! as RSAPrivateKey);
          if (utf8List != null) {
            String token = utf8.decode((utf8List));
            yield AuthenticateWithBiometricFetchSuccess(token);
          }
          return;
        }
        yield AuthenticateWithBiometricFetchFailure(
            response.message ?? 'An unknown error occurred.');
      }
    } else if (event is BiometricsStatusCheckEvent) {
      if (event.status != null) {
        if (!event.status!) {
          yield BiometricsStatusCheckingState();
          await sessionManager.clearBiometrics();
          yield BiometricsStatusCheckedSuccessState(event.status!);
          return;
        }
        yield BiometricsStatusCheckingState();
        yield BiometricsStatusCheckedSuccessState(event.status ?? true);
      } else {
        yield BiometricsStatusCheckingState();
        final biometricsInfo = await sessionManager.readBiometricInfo();
        yield BiometricsStatusCheckedSuccessState(biometricsInfo != null);
      }
    } else if (event is RegisterBiometricsEvent) {
      /*  var list = RSAUtils.generateKeys(2048);
      var rsa = RSAUtils.getInstance(list[0], list[1]);
      // String str = "Come on Wuhan, China.";
      // Uint8List sstr = utf8.encode(str);
      // var enstr = rsa.encryptByPublicKey(sstr);

      //  final key =
      //     RsaKeyHelper().generateKeyPair();
      // final publicKey = RsaKeyHelper()
      //     .encodePublicKeyToPem(key.publicKey);
      // final privateKey = RsaKeyHelper()
      //     .encodePrivateKeyToPem(key.privateKey);
      final response = await controller.registerBiometric(
          publicKey: list[0], deviceId: await appManager.getDeviceId());
      if (response.ok) {
        final responseKey = response.data.key;
        final id = response.data.id;
        final deviceId = response.data.deviceId;
        debugPrint('$responseKey');
        // final pasedPrivatedKey = RsaKeyHelper()
        //     .parsePrivateKeyFromPem(privateKey);
        // final decryptKey = RsaKeyHelper().decrypt(
        //     response.data.key, pasedPrivatedKey);

        // String str = "Come on Wuhan, China.";
        // Uint8List sstr = utf8.encode(responseKey);
        // var enstr = rsa.encryptByPublicKey(sstr);

        Uint8List ssstre = rsa.decryptByPrivateKey(base64Decode(responseKey!));
        String utf8String = utf8.decode(ssstre);
        debugPrint('decrypted key $utf8String');

        sessionManager.storeBiometricInfo(BiometricRegisterModel(
            key: responseKey,
            // utf8String: utf8String,
            deviceId: deviceId,
            id: id,
            // publicKey: list[0],
            privateKey: list[1],
            userId: (await sessionManager.getCurrentUser())?.id ?? ''));

        yield RegisterBiometricsSuccessState(response.message);
      }
         */
    }
  }
}
