import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Username field
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16),
            // Password field
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            // Error message
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            // Login button
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  // Handle the login logic
  void _handleLogin() {
    setState(() {
      _isLoading = true;
      _errorMessage = ''; // Clear any previous error message
    });

    final String username = _usernameController.text;
    final String password = _passwordController.text;

    // Using the AuthProvider to handle login logic
    Provider.of<AuthProvider>(context, listen: false).login(username, password);

    // Check login status after attempting login
    Future.delayed(Duration(seconds: 1), () {
      if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn) {
        Navigator.pushReplacementNamed(context, '/'); // Navigate to the main screen
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Invalid credentials. Please try again.';
        });
      }
    });
  }
}
