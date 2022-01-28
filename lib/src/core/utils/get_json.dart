import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future<dynamic> getJson(String fileName) async {
  return jsonDecode(await rootBundle.loadString('assets/mock/$fileName'));
}
