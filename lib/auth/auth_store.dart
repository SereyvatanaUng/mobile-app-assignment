// import 'package:shared_preferences/shared_preferences.dart';

class AuthStore {
  static const String _isLoggedInKey = 'isLoggedIn';
  bool _isLogin = false;
  // Check if the user is logged in
  Future<bool> get isLoggedIn async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // return prefs.getBool(_isLoggedInKey) ?? false;
    return _isLogin;

  }

  // Perform login and save the login state
  Future<void> login(String username, String password) async {
    // TODO: Implement actual authentication logic
    // Simulate a successful login by saving the login state
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setBool(_isLoggedInKey, true);
    if (username == '1' && password == '1') _isLogin == true;
  }

  // Perform logout and clear the login state
  Future<void> logout() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setBool(_isLoggedInKey, false);
    _isLogin == false;
  }
}



// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class AuthStore {
//   final FlutterSecureStorage _storage = FlutterSecureStorage();
//
//   static const String _keyIsLoggedIn = 'isLoggedIn';
//
//   // Check if the user is logged in by fetching the stored value
//   Future<bool> get isLoggedIn async {
//     String? value = await _storage.read(key: _keyIsLoggedIn);
//     return value == 'true';  // Returns true if the value is 'true'
//   }
//
//   // Log in and store the state securely
//   Future<void> login(String username, String password) async {
//     if (username == "1" && password == "1") {
//       await _storage.write(key: _keyIsLoggedIn, value: 'true');  // Securely store login state
//     }
//   }
//
//   // Log out and clear the stored state securely
//   Future<void> logout() async {
//     await _storage.delete(key: _keyIsLoggedIn);  // Clear the login state
//   }
// }
