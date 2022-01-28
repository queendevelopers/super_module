import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rest_client/rest_client.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';
import 'package:super_module/src/features/user/data/model/user_response_model.dart';
import 'package:super_module/src/features/user/data/requests/user_endpoint_request/user_information_update_endpoint.dart';
import 'package:super_module/src/features/user/data/session/i_session_manager.dart';
import 'package:super_module/src/features/user/domain/repositories/i_user_remote_repository.dart';

@Injectable(as: IUserRemoteRepository)
class UserRemoteRepository implements IUserRemoteRepository {
  final IHttpHelper httpHelper;
  final ISessionManager sessionManager;

  UserRemoteRepository(this.httpHelper, this.sessionManager);

  @override
  Future<UserResponseModel> userInformationUpdate(
      {required UserModel model, required String? token}) async {
    try {
      final response = await httpHelper.request(
          UserInformationUpdateEndpoint(), model, headers: {
        'authorization': 'Bearer ${token ?? await sessionManager.getToken()}'
      });
      debugPrint(response.toString());
      debugPrint(model.phone.toString());
      return UserResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
