import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefKeys {
  static const String isDarkMode = 'isDarkMode';
  static const String language = 'language';
  static const String region = 'region';
}

class SharedPrefHelper {
  SharedPrefHelper._();
  static SharedPreferences? _instance;
  static init() async {
    return _instance ??= await SharedPreferences.getInstance();
  }

  static setString(String key, String value) async {
    await _instance?.setString(key, value);
  }

  static String? getString(String key) {
    return _instance?.getString(key);
  }

  static setBool(String key, bool value) async {
    await _instance?.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _instance?.getBool(key);
  }
}
