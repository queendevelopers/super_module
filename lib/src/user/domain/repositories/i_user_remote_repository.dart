import 'package:flutter/foundation.dart';
import 'package:super_module/src/auth/data/models/user_model.dart';
import 'package:super_module/src/user/data/model/user_response_model.dart';

abstract class IUserRemoteRepository {
  Future<UserResponseModel> userInformationUpdate(
      {@required UserModel model, String token});
}
