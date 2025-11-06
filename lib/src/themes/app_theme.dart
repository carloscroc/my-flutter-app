import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyText2: TextStyle(fontSize: 16),
      ),
    );
  }
}
