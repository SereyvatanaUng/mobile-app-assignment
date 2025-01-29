import 'package:flutter/material.dart';
class AppThemes {
  // Light Theme Configuration
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.grey[600],
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
    ),
    // iconAppBarTheme: IconThemeData(
    //   color: Color.
    // )
  );



  // Dark Theme Configuration
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.grey[400],
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
    ),

  );
}
