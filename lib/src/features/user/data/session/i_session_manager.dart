import 'package:super_module/src/features/auth/data/models/biometric_register_model.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';

abstract class ISessionManager {
  Future<void> saveToken({required String accessToken});

  Future<String?> getToken();

  Future<void> clearSession();

  Future<bool> get isAuthenticated;

  Future<UserModel?> getCurrentUser();

  Future<void> storeBiometricInfo(BiometricRegisterModel? model);

  Future<bool> isBiometricsEnabled();

  Future<BiometricRegisterModel?> readBiometricInfo();

  Future<void> clearBiometrics();

  Future<void> saveCurrentUser({UserModel? user});
}
