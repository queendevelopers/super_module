import 'package:rest_client/rest_client.dart';

class GetDefaultAddressEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/user/address/default';
}
