import 'package:rest_client/rest_client.dart';

class SetDefaultAddressEndpoint implements IRequestEndPoint {
  final id;

  SetDefaultAddressEndpoint(this.id);

  @override
  RequestMethod method = RequestMethod.PATCH;

  @override
  String get url => '/user/addresses/$id/default';
}
