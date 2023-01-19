import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const THEME_STATUS = 'theme_status';

  getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }

  setTheme(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }
}
