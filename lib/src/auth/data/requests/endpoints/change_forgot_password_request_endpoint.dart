import 'package:rest_client/rest_client.dart';

class ChangeForgotPasswordRequestEndPoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => '/auth/changepassword';
}
