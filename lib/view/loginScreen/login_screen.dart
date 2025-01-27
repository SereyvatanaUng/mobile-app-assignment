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
  String _selectedLanguage = 'English (UK)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildHeaderPage(),
              _buildBodyPage(),
              _buildBottomNavBar()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderPage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value:
                  _selectedLanguage, // Ensure this variable is properly initialized
              items: const [
                DropdownMenuItem(
                  value: "English (UK)",
                  child: Text("English (UK)"),
                ),
                DropdownMenuItem(
                  value: "English (US)",
                  child: Text("English (US)"),
                ),
              ],
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    _selectedLanguage =
                        value; // Update the state with the new value
                  });
                }
              },
            ),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color(0xFFDE0046),
                  Color(0xFFF7A34B),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              blendMode: BlendMode.srcIn,
              child: Image.asset(
                'lib/assets/fi_instagram.png',
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        const Text(
          "Login",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            labelText: "Email, Username, or Mobile phone number",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _isLoading ? null : _handleLogin,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: _isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  "Log in",
                  style: TextStyle(color: Colors.white),
                ),
        ),
        if (_errorMessage.isNotEmpty) ...[
          const SizedBox(height: 10),
          Text(
            _errorMessage,
            style: const TextStyle(color: Colors.red),
          ),
        ],
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            // TODO: Navigate to Forgot Password screen
          },
          child: const Text(
            "Forgotten Password?",
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _isLoading ? null : _handleLogin,
          style: ElevatedButton.styleFrom(
            // backgroundColor: Colors.transparent,
            // foregroundColor: Colors.transparent,
            // disabledBackgroundColor: Colors.transparent,
            // shape: LinearBorder(side: BorderSide(color: )),
            shadowColor: Colors.transparent,
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: _isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  "Create new account",
                  style: TextStyle(color: Colors.black),
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/Meta_logo.png',
              height: 20,
            ),
            const SizedBox(width: 8),
            const Text(
              "Meta",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ],
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
        Navigator.pushReplacementNamed(
            context, '/'); // Navigate to the main screen
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Invalid credentials. Please try again.';
        });
      }
    });
  }
}
