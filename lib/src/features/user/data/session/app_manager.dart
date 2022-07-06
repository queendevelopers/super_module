import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_module/src/core/super_keys.dart';
import 'package:super_module/src/features/user/data/session/i_app_manager.dart';

@Injectable(as: IAppManager)
class AppManager implements IAppManager {
  SharedPreferences sharedPreferences;

  AppManager(this.sharedPreferences);

  @override
  Future<bool> isAppFirstTime() async {
    try {
      final result = sharedPreferences.getBool(SuperKeys.isAppFistTime);
      if (result != null) {
        return result;
      }
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  @override
  Future<void> saveBool({required String key, required bool value}) async {
    try {
      await sharedPreferences.setBool(SuperKeys.isAppFistTime, value);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getDeviceId() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        final identifier = build.androidId;
        return identifier;
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        final identifier = data.identifierForVendor; //
        return identifier;
      } else {
        return 'unknown';
      }
    } on PlatformException {
      print('Failed to get platform version');
      return 'Failed to get platform version';
    }
  }

  @override
  Future<String?> getDeviceIpAddress() async {
    try {
      final SharedPreferences _sharedPreferences =
          await SharedPreferences.getInstance();
      return _sharedPreferences.getString('currentIP');
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> initiateDeviceIpAddress() async {
    try {
      final Dio dio = Dio();
      final SharedPreferences _sharedPreferences =
          await SharedPreferences.getInstance();
      final response = await dio.get('https://api.ipify.org/?format=json');
      if (response.statusCode == 200) {
        final String currentIP = response.data['ip'];
        await _sharedPreferences.setString('currentIP', currentIP);
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  bool getBool({required String key, bool defValue = false}) {
    try {
      final result = sharedPreferences.getBool(key);
      if (result != null) {
        return result;
      }
      return defValue;
    } catch (e) {
      return defValue;
    }
  }
}
