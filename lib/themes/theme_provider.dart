import 'package:flutter/material.dart'; // Не забудьте добавить этот импорт
import 'package:my_services/themes/dark_mode.dart';
import 'package:my_services/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  // Используем более понятное имя для геттера
  ThemeData get currentTheme => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  // Сеттер для установки темы
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // Метод для переключения между светлой и темной темой
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
