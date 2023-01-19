import 'package:flutter/cupertino.dart';
import 'package:learning_flutter/ui/theme/theme_preferences.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemePreferences _preferences = ThemePreferences();

  ThemeModel() {
    _isDarkTheme = false;
    _preferences = ThemePreferences();
    getPreferences();
  }

  getPreferences() async {
    _isDarkTheme = await _preferences.getTheme();
    notifyListeners();
  }

  set isDarkTheme(bool themeValue) {
    _isDarkTheme = themeValue;
    _preferences.setTheme(themeValue);
    notifyListeners();
  }
}
