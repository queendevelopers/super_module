import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_module/src/core/super_keys.dart';
import 'package:super_module/src/features/auth/data/models/biometric_register_model.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';
import 'package:super_module/src/features/user/data/session/i_session_manager.dart';
import 'package:super_module/src/features/user/domain/entity/store_recent_search_entity.dart';

@Injectable(as: ISessionManager)
class SessionManager implements ISessionManager {
  final FlutterSecureStorage _secureStorage;

  SessionManager(this._secureStorage);

  @override
  Future<String?> getToken() {
    try {
      return _secureStorage.read(key: SuperKeys.tokenKey);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> saveToken({required String accessToken}) async {
    try {
      await _secureStorage.write(key: SuperKeys.tokenKey, value: accessToken);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<bool> get isAuthenticated async {
    try {
      final token = await getToken();
      if (token != null) {
        return !Jwt.isExpired(token);
      }
      return false;
    } on Exception {
      return false;
    }
  }

  @override
  Future<void> clearSession() async {
    try {
      await _secureStorage.delete(key: SuperKeys.userKey);
      await _secureStorage.delete(key: SuperKeys.tokenKey);
      await _secureStorage.delete(key: SuperKeys.refreshToken);
      debugPrint('session cleared successfully!!');
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> storeBiometricInfo(BiometricRegisterModel? model) async {
    try {
      await _secureStorage.write(
          key: SuperKeys.userBiometricKey, value: json.encode(model));
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<BiometricRegisterModel?> readBiometricInfo() async {
    try {
      final resultSting =
          await _secureStorage.read(key: SuperKeys.userBiometricKey);
      if (resultSting != null) {
        BiometricRegisterModel user =
            BiometricRegisterModel.fromJson(json.decode(resultSting));
        return Future.value(user);
      }
      return null;
    } on Exception {
      await _secureStorage.delete(key: SuperKeys.userBiometricKey);
      rethrow;
    }
  }

  @override
  Future<void> saveCurrentUser({UserModel? user}) async {
    try {
      await _secureStorage.write(
          key: SuperKeys.userKey, value: json.encode(user));
      debugPrint('User ${user?.name} saved in local storage.');
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final stringUser = await _secureStorage.read(key: SuperKeys.userKey);
      if (stringUser != null) {
        UserModel user = UserModel.fromJson(json.decode(stringUser));
        debugPrint('User ${user.name} reading from local storage.');
        return Future.value(user);
      }
      return null;
    } on Exception {
      await _secureStorage.delete(key: SuperKeys.userKey);
      rethrow;
    }
  }

  @override
  Future<bool> isBiometricsEnabled() async {
    final response = await _secureStorage.read(key: SuperKeys.userBiometricKey);
    return response != null;
  }

  @override
  Future<void> clearBiometrics() async {
    try {
      await _secureStorage.delete(key: SuperKeys.userBiometricKey);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<StoreRecentSearchEntity>> getHistorySearches() async {
    try {
      // deleteAllPreviousSearchHistory();
      final SharedPreferences _sharedPreferences =
          await SharedPreferences.getInstance();
      List<StoreRecentSearchEntity> historyItem = [];
      List<String> nameHistoryList =
          _sharedPreferences.getStringList(SuperKeys.searchHistoryName) ?? [];
      List<String> dateHistoryList =
          _sharedPreferences.getStringList(SuperKeys.searchHistoryDate) ?? [];
      for (int i = 0; i < nameHistoryList.length; i++) {
        debugPrint('$i  ${nameHistoryList[i]}');
        historyItem.add(StoreRecentSearchEntity(
            name: nameHistoryList[i], searchDate: dateHistoryList[i]));
      }
      return historyItem;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAllPreviousSearchHistory() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    await _sharedPreferences.remove(SuperKeys.searchHistoryDate);
    await _sharedPreferences.remove(SuperKeys.searchHistoryName);
  }

  @override
  Future<void> saveCurrentSearchItem(String searchItem) async {
    try {
      final SharedPreferences _sharedPreferences =
          await SharedPreferences.getInstance();
      if (searchItem.trim().isNotEmpty) {
        List<String> nameHistoryList =
            _sharedPreferences.getStringList(SuperKeys.searchHistoryName) ?? [];
        List<String> dateHistoryList =
            _sharedPreferences.getStringList(SuperKeys.searchHistoryDate) ?? [];
        nameHistoryList.add(searchItem);
        dateHistoryList.add(DateTime.now().toString());
        await _sharedPreferences.setStringList(
            SuperKeys.searchHistoryName, nameHistoryList);
        await _sharedPreferences.setStringList(
            SuperKeys.searchHistoryDate, dateHistoryList);
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> saveCartCount(int count) async {
    final box = await Hive.openBox<int>(SuperKeys.cartBox);
    box.put(SuperKeys.cartCount, count.toInt());
  }

  @override
  Future<int> readCartCount() async {
    final prefs = await Hive.openBox<int>(SuperKeys.cartBox);
    return prefs.get(SuperKeys.cartCount) ?? 0;
  }

  @override
  Future<void> saveWishlistProduct(
      {required String productId, required bool isWishlist}) async {
    final box = await Hive.openBox<bool>(SuperKeys.wishlistBox);
    box.put(productId, isWishlist);
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      await _secureStorage.read(
        key: SuperKeys.refreshToken,
      );
    } on Exception {
      rethrow;
    }
    return null;
  }

  @override
  Future<void> saveRefreshToken({required String refreshToken}) async {
    try {
      await _secureStorage.write(
          key: SuperKeys.refreshToken, value: refreshToken);
    } on Exception {
      rethrow;
    }
  }
}
