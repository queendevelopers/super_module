import 'package:super_module/src/features/auth/data/models/biometric_register_model.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';
import 'package:super_module/src/features/user/domain/entity/store_recent_search_entity.dart';

abstract class ISessionManager {
  Future<void> saveToken({required String accessToken});

  Future<String?> getToken();

  Future<void> clearSession();

  Future<bool> get isAuthenticated;

  Future<void> saveCurrentUser({required UserModel user});

  Future<UserModel?> getCurrentUser();

  Future<void> storeBiometricInfo(BiometricRegisterModel? model);

  Future<bool> isBiometricsEnabled();

  Future<BiometricRegisterModel?> readBiometricInfo();

  Future<void> clearBiometrics();

  Future<void> saveCurrentSearchItem(String searchItem);

  Future<List<StoreRecentSearchEntity>> getHistorySearches();

  Future<void> deleteAllPreviousSearchHistory();

  Future<void> saveWishlistProduct(
      {required String productId, required bool isWishlist});

  Future<void> saveCartCount(int count);

  Future<int> readCartCount();
}
