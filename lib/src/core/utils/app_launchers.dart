import 'package:url_launcher/url_launcher.dart';

class AppLaunchers {
  void launchURL(String _url) async => await canLaunchUrl(Uri.parse(_url))
      ? await launchUrl(Uri.parse(_url))
      : throw 'Could not launch $_url';
}
