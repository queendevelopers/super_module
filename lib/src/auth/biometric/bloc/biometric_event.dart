part of 'biometric_bloc.dart';

@immutable
abstract class BiometricEvent {}

class HasBiometricAuthenticationEvent extends BiometricEvent {}

class GetAllAvailableBiometricsEvent extends BiometricEvent {}

class AuthenticateWithBiometricEvent extends BiometricEvent {}

class BiometricsStatusCheckEvent extends BiometricEvent {
  final bool status;

  BiometricsStatusCheckEvent({required this.status});
}
