import 'package:flutter/material.dart';

class AppScreenProvider extends ChangeNotifier {
  int _currentIndex = 0;
  bool _isBottomNavRequired = true; // Flag to determine if bottom nav is required

  int get currentIndex => _currentIndex;
  bool get isBottomNavRequired => _isBottomNavRequired;

  void updateIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }
  void toggleBottomNav(bool value) {
    _isBottomNavRequired = value;
    notifyListeners();
  }
}