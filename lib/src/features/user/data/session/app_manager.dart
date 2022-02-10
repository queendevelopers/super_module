import 'dart:io';

import 'package:device_info/device_info.dart';
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
}
