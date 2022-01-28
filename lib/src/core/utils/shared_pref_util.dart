import 'package:shared_preferences/shared_preferences.dart';

addStringToPref(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

addBoolToPref(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

Future<String?> getStringPref(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? stringValue = prefs.getString(key);
  return stringValue;
}

Future<bool?> getBoolPref(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? value = prefs.getBool(key);
  return value;
}

clearAllPref() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
}
