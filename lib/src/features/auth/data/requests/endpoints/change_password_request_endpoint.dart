import 'package:rest_client/rest_client.dart';

class ChangePasswordRequestEndPoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.PATCH;

  @override
  String get url => '/user/profile/change-password';
}
