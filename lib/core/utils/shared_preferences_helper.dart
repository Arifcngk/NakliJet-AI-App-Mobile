import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // Kullanıcının giriş yapma durumunu kaydet
  static Future<void> setLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  // Kullanıcının giriş yapma durumunu al
  static Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  // Tüm shared preferences'ı temizle (logout işlemi için kullanılabilir)
  static Future<void> clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
