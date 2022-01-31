import 'package:super_module/src/features/auth/data/models/biometric_register_model.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';

abstract class ISessionManager {
  Future<void> initiateUserIpAddress();

  Future<String?> getUserIpAddress();

  Future<void> saveToken({required String accessToken});

  Future<String?> getToken();

  Future<void> clearSession();

  Future<bool> get isAuthenticated;

  Future<UserModel?> getCurrentUser();

  Future<void> storeBiometricInfo(BiometricRegisterModel? model);

  Future<bool> isBiometricsEnabled();

  Future<BiometricRegisterModel?> readBiometricInfo();

  Future<void> clearBiometrics();

  Future<void> saveCurrentUser({required UserModel user});

// Future<List<StoreRecentSearchEntity>> getHistorySearches();
//
// Future<void> deleteAllPreviousSearchHistory();

}
