import 'package:super_module/src/core/service/remote_config/data/models/firebase_remote_config_model.dart';

abstract class IFirebaseRepository {
  Future<FirebaseRemoteConfigModel> getFirebaseRemoteConfig();
}
