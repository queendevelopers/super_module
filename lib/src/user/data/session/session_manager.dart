import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:super_module/src/auth/data/models/biometric_register_model.dart';
import 'package:super_module/src/auth/data/models/user_model.dart';
import 'package:super_module/src/core/super_keys.dart';
import 'package:super_module/src/user/data/session/i_session_manager.dart';

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
      debugPrint('session cleared');
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
      final resultSting = await _secureStorage.read(key: SuperKeys.userBiometricKey);
      if (resultSting != null) {
        BiometricRegisterModel user =
            BiometricRegisterModel.fromJson(json.decode(resultSting));
        debugPrint('Biometric Information $resultSting');
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
      await _secureStorage.write(key: SuperKeys.userKey, value: json.encode(user));
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
        debugPrint('user $stringUser');
        UserModel user = UserModel.fromJson(json.decode(stringUser));
        debugPrint('User ${user.name} reading from local storage.');
        return Future.value(user);
      }
      return UserModel();
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

}
