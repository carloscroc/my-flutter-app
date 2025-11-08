import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color(0xFF6750A4),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16),
      ),
    );
  }
}
