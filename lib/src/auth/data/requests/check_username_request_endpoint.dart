import 'package:rest_client/rest_client.dart';

class CheckUsernameRequestEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => '/usernames';
}
