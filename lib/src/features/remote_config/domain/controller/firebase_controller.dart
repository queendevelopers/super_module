import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/remote_config/data/models/firebase_remote_config_model.dart';
import 'package:super_module/src/features/remote_config/domain/repositories/i_firebase_repository.dart';

abstract class IFirebaseController {
  Future<FirebaseRemoteConfigModel> getFirebaseRemoteConfig();
}

@Injectable(as: IFirebaseController)
class FirebaseController implements IFirebaseController {
  final IFirebaseRepository repository;

  FirebaseController(this.repository);

  @override
  Future<FirebaseRemoteConfigModel> getFirebaseRemoteConfig() async {
    return await repository.getFirebaseRemoteConfig();
  }
}
