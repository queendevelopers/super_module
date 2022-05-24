import 'package:flutter_rest_client/flutter_rest_client.dart';

class UpdateAddressRequestEndpoint implements IRequestEndPoint {
  final String id;

  UpdateAddressRequestEndpoint({required this.id});

  @override
  RequestMethod method = RequestMethod.PATCH;

  @override
  String get url => '/user/shipping/address/$id';
}
