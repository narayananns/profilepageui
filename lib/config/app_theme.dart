import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF1C1C1E),
    primaryColor: const Color(0xFF0EA5E9),
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(color: Color(0xFF1C1C1E), iconTheme: IconThemeData(color: Colors.white)),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color(0xFF0EA5E9),
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(color: Colors.white, iconTheme: IconThemeData(color: Colors.black)),
  );
}
