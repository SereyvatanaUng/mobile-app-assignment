import 'package:flutter/material.dart';
import 'package:mobile_app_assignment/theme/theme_provioder.dart';
import 'package:mobile_app_assignment/view/app_screen.dart';
import 'package:mobile_app_assignment/view/app_screen_provider.dart';
import 'package:mobile_app_assignment/view/loginScreen/login_screen.dart';
import 'package:provider/provider.dart';

import 'auth/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeLogic()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AppScreenProvider()),
      ],
      child: InstagramApp(),
    ),
  );
}

class InstagramApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeLogic = Provider.of<ThemeLogic>(context);
    ThemeMode mode = context.watch<ThemeLogic>().mode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeLogic.mode,
      theme: themeLogic.lightTheme, // Light theme
      darkTheme: themeLogic.darkTheme, // Dark theme
      initialRoute: '/',
      routes: {
        '/': (context) => Consumer<AuthProvider>(
          builder: (context, auth, _) => auth.isLoggedIn ? AppScreen() : LoginScreen(),
        ),
      },
    );
  }
}
