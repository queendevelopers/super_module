import 'package:flutter_rest_client/flutter_rest_client.dart';

class ChangeForgotPasswordRequestEndPoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => '/auth/changepassword';
}
