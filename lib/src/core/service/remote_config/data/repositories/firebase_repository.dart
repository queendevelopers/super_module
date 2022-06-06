import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/core/service/remote_config/data/models/firebase_remote_config_model.dart';
import 'package:super_module/src/core/service/remote_config/domain/repositories/i_firebase_repository.dart';

@Injectable(as: IFirebaseRepository)
class FirebaseRepository implements IFirebaseRepository {
  @override
  Future<FirebaseRemoteConfigModel> getFirebaseRemoteConfig() async {
    try {
      //Get Latest version info from firebase config
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      // Using default duration to force fetching from remote server.
      await remoteConfig.fetch();
      await remoteConfig.fetchAndActivate();
      final data = remoteConfig.getAll()['version_information'];
      debugPrint('${jsonDecode(data.toString())}');
      return FirebaseRemoteConfigModel.fromJson(jsonDecode(data.toString()));
    } catch (exception) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');
      rethrow;
    }
  }
}
