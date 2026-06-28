import 'package:flutter/material.dart';

import '../services/theme_service.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeService _service = ThemeService();

  bool _isDark = true;

  bool get isDark => _isDark;

  ThemeMode get themeMode =>
      _isDark ? ThemeMode.dark : ThemeMode.light;

  Future<void> loadTheme() async {
    _isDark = await _service.loadTheme();

    notifyListeners();
  }

  Future<void> toggleTheme(bool value) async {
    _isDark = value;

    await _service.saveTheme(value);

    notifyListeners();
  }
}