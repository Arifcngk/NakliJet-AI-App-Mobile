import 'package:flutter/material.dart';

class ThemeApp {
  ThemeApp._();
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFEEEDEB),
      colorScheme: ColorScheme.fromSeed(
        primary: const Color(0xFF082255),
        secondary: const Color(0xFFf1f1f1),
        seedColor: Colors.deepPurple,
      ),
      useMaterial3: true,
    );
  }
}
