import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static Future<bool> saveUser(String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    return await pref.setString(key, value);
  }

  static Future<String?> getValue(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  static Future<bool> removeValue(String key) async {
    final pref = await SharedPreferences.getInstance();
    return await pref.remove(key);
  }

  static Future<bool> clearStorage() async {
    final pref = await SharedPreferences.getInstance();
    return await pref.clear();
  }
}
