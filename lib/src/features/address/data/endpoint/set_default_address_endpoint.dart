import 'package:flutter_rest_client/flutter_rest_client.dart';

class SetDefaultAddressEndpoint implements IRequestEndPoint {
  final id;

  SetDefaultAddressEndpoint(this.id);

  @override
  RequestMethod method = RequestMethod.PATCH;

  @override
  String get url => '/user/address/$id/default';
}
