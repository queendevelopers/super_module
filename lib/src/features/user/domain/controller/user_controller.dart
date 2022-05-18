import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';
import 'package:super_module/src/features/user/data/model/user_response_model.dart';
import 'package:super_module/src/features/user/domain/repositories/i_user_remote_repository.dart';

abstract class IUserController {
  Future<ResponseEntity<UserModel>> getUserProfile();

  Future<UserResponseModel> userInformationUpdate(
      {required UserModel model, String? token});
}

@Injectable(as: IUserController)
class UserController implements IUserController {
  final IUserRemoteRepository remoteRepository;

  UserController(this.remoteRepository);

  @override
  Future<UserResponseModel> userInformationUpdate(
      {required UserModel model, String? token}) {
    return remoteRepository.userInformationUpdate(model: model, token: token);
  }

  @override
  Future<ResponseEntity<UserModel>> getUserProfile() {
    return remoteRepository.getUserProfile();
  }
}
