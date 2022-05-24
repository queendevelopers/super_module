import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';
import 'package:super_module/src/features/user/data/model/user_response_model.dart';

abstract class IUserRemoteRepository {
  Future<ResponseEntity<UserModel>> getUserProfile();

  Future<UserResponseModel> userInformationUpdate(
      {required UserModel model, required String? token});
}
