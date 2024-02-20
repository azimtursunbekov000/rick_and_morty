import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType {
  light,
  black,
}

class ThemeManager with ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();

  ThemeData get currentTheme => _currentTheme;

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ThemeType? themeType = ThemeType.values[prefs.getInt('themeType') ?? 0];
    _setTheme(
      themeType ?? ThemeType.light,
    );
  }

  void _setTheme(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.light:
        _currentTheme = ThemeData.light();
        break;
      case ThemeType.black:
        _currentTheme = ThemeData.dark();
        break;
    }
    notifyListeners();
  }

  Future<void> changeTheme(ThemeType themeType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeType', themeType.index);
    _setTheme(themeType);
  }
}
