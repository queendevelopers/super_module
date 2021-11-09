import 'package:rest_client/rest_client.dart';

class DeleteAddressRequestEndpoint implements IRequestEndPoint {
  final id;

  DeleteAddressRequestEndpoint(this.id);

  @override
  RequestMethod method = RequestMethod.DELETE;

  @override
  String get url => '/user/addresses/$id';
}
