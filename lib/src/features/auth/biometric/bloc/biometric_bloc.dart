import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';
import 'package:super_module/src/features/auth/domain/repositories/i_auth_remote_repository.dart';
import 'package:super_module/src/features/user/data/session/i_session_manager.dart';

part 'biometric_event.dart';
part 'biometric_state.dart';

@injectable
class BiometricBloc extends Bloc<BiometricEvent, BiometricState> {
  BiometricBloc(this.repository, this.sessionManager)
      : super(BiometricInitial());
  final LocalAuthentication? auth = LocalAuthentication();
  final IAuthRemoteRepository repository;
  final ISessionManager sessionManager;

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

      /*RSAUtils rsaUtils =
          RSAUtils.getInstance(local?.publickey, local?.privateKey);
      Uint8List sstr = utf8.encode(local!.encKey!) as Uint8List;
      final enstr = rsaUtils.encryptByPrivateKey(sstr);
      final encKey = base64Encode(enstr);

      debugPrint(local.publickey);
      debugPrint(local.privateKey);

      final response = await repository.authenticateWithBiometrics(
          BiometricRegisterModel(
              id: local.id, encKey: encKey, deviceId: local.deviceId));

      if (response.ok) {
        final utf8List = rsaUtils.decryptByPrivateKey(
            base64.decode(response.data.encryptedAccessToken));
        String token = utf8.decode(utf8List);
        debugPrint(token);
        yield AuthenticateWithBiometricFetchSuccess(token);
        return;
              yield AuthenticateWithBiometricFetchFailure(response.message);

      }*/
    } else if (event is BiometricsStatusCheckEvent) {
      if (event.status != null) {
        if (!event.status) {
          yield BiometricsStatusCheckingState();
          await sessionManager.clearBiometrics();
          yield BiometricsStatusCheckedSuccessState(event.status);
          return;
        }
        yield BiometricsStatusCheckingState();
        yield BiometricsStatusCheckedSuccessState(event.status);
      } else {
        yield BiometricsStatusCheckingState();
        final biometricsInfo = await sessionManager.readBiometricInfo();
        yield BiometricsStatusCheckedSuccessState(biometricsInfo != null);
      }
    }
  }
}
