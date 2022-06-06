import 'package:flutter_rest_client/flutter_rest_client.dart';

class DeleteAddressRequestEndpoint implements IRequestEndPoint {
  final id;

  DeleteAddressRequestEndpoint(this.id);

  @override
  RequestMethod method = RequestMethod.DELETE;

  @override
  String get url => '/user/shipping/address/$id';
}
