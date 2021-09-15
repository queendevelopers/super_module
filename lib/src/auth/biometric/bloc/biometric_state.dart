part of 'biometric_bloc.dart';

@immutable
abstract class BiometricState {}

class BiometricInitial extends BiometricState {}

//check biometrics
class BiometricAuthenticationFetching extends BiometricState {}

class BiometricAuthenticationFetchSuccess extends BiometricState {
  final bool hasBiometric;

  BiometricAuthenticationFetchSuccess({this.hasBiometric});
}

//Get all biometrics
class AllAvailableBiometricsFetching extends BiometricState {}

class AllAvailableBiometricsFetchFailure extends BiometricState {}

class AllAvailableBiometricsFetchSuccess extends BiometricState {
  final List<BiometricType> availableBiometrics;

  AllAvailableBiometricsFetchSuccess(this.availableBiometrics);
}

class AuthenticateWithBiometricFetching extends BiometricState {}

class AuthenticateWithBiometricFetchFailure extends BiometricState {
  final String message;

  AuthenticateWithBiometricFetchFailure(this.message);
}

class AuthenticateWithBiometricFetchSuccess extends BiometricState {
  final String encryptedAccessToken;

  AuthenticateWithBiometricFetchSuccess(this.encryptedAccessToken);
}

class BiometricsStatusCheckingState extends BiometricState {}

class BiometricsStatusCheckedSuccessState extends BiometricState {
  final bool isEnabled;

  BiometricsStatusCheckedSuccessState(this.isEnabled);
}
