import 'package:flutter/material.dart';
// import 'package:mobile_app_assignment/theme/theme_constants.dart';
import 'package:mobile_app_assignment/theme/theme_provioder.dart';
import 'package:provider/provider.dart';
import 'homeScreen/home_screen.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeLogic(),
      child: const InstagramApp(),
    )
  );
}
class InstagramApp extends StatelessWidget {
  const InstagramApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeLogic = Provider.of<ThemeLogic>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: const InstagramHome(),
      theme: themeLogic.lightTheme, // Light theme
      darkTheme: themeLogic.darkTheme, // Dark theme
      themeMode: themeLogic.mode,
    );
  }
}
