import 'package:rest_client/rest_client.dart';

class UserRankListRequestEndPoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/posts';
}
