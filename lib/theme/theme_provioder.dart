import 'package:flutter/material.dart';
import 'package:mobile_app_assignment/theme/theme_constants.dart'; // Ensure this path is correct

class ThemeLogic extends ChangeNotifier {
  // Default theme mode is set to system
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;

  // Access the light and dark themes defined in AppThemes
  ThemeData get lightTheme => AppThemes.lightTheme;
  ThemeData get darkTheme => AppThemes.darkTheme;

  // Method to change theme to Dark
  void changeToDark() {
    _mode = ThemeMode.dark;
    notifyListeners(); // Notify listeners so that UI can be updated
  }

  // Method to change theme to Light
  void changeToLight() {
    _mode = ThemeMode.light;
    notifyListeners(); // Notify listeners so that UI can be updated
  }
}
