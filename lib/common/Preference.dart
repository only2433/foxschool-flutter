import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getString(String key) async
{
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final String? result = preferences.getString(key);
  return result ?? "";
}

Future<int> getInt(String key) async
{
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final int? result = preferences.getInt(key);
  return result ?? 0;
}

Future<bool> getBoolean(String key) async
{
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final bool? result = preferences.getBool(key);
  return result ?? false;
}



Future<Map<String, dynamic>?> getObject(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String result = prefs.getString(key) ?? '';
  if (result.isNotEmpty) {
    return json.decode(result);
  }
  return null;
}

Future<void> setString(String key, String value) async
{
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString(key, value);
}

Future<void> setInt(String key, int value) async
{
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setInt(key, value);
}

Future<void> setBoolean(String key, bool value) async
{
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setBool(key, value);
}

Future<void> setObject(String key, Object? data) async
{
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  String? result = null;
  if(data != null)
    {
      result = json.encode(data);
    }
  await preferences.setString(key, result ?? "");
}


