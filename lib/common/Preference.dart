import 'package:shared_preferences/shared_preferences.dart';

Future<String> getString(String key) async
{
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final String? result = preferences.getString(key);
  return result ?? "";
}

Future<bool> getBoolean(String key) async
{
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final bool? result = preferences.getBool(key);
  return result ?? false;
}

Future<void> setString(String key, String value) async
{
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString(key, value);
}

Future<void> setBoolean(String key, bool value) async
{
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setBool(key, value);
}


