import 'package:rest_client/rest_client.dart';

class VerifyOtpEndpoint implements IRequestEndPoint {
  final int otpCode;

  VerifyOtpEndpoint(this.otpCode);

  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/auth/confirmation/phone/$otpCode';
}
