

import 'package:flutter/material.dart';
import 'auth_store.dart';  // Import the updated AuthStore

class AuthProvider extends ChangeNotifier {
  final AuthStore _authStore = AuthStore();  // Create an instance of AuthStore

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  // Initialize the state when the provider is created
  AuthProvider() {
    _loadAuthState();
  }

  // Load the stored login state when the app starts
  Future<void> _loadAuthState() async {
    _isLoggedIn = await _authStore.isLoggedIn;
    notifyListeners();  // Notify listeners after loading the state
  }

  // Perform login action
  Future<void> login(String username, String password) async {
    await _authStore.login(username, password);
    _isLoggedIn = true;
    notifyListeners();  // Notify listeners after login action
  }

  // Perform logout action
  Future<void> logout() async {
    await _authStore.logout();
    _isLoggedIn = false;
    notifyListeners();  // Notify listeners after logout action
  }
}
