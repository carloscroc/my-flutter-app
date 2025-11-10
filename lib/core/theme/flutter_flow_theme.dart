// Compatibility shim: forward the old `FlutterFlowTheme` API to `AppTheme`.
import 'package:flutter/material.dart';
import 'app_theme.dart';

/// Deprecated compatibility wrapper. Code should prefer `AppTheme`.
class FlutterFlowTheme {
  static Color get primaryColor => AppTheme.primaryColor;
  static Color get secondaryColor => AppTheme.secondaryColor;
  static Color get tertiaryColor => AppTheme.tertiaryColor;
  static Color get alternate => AppTheme.alternate;
  static Color get primaryText => AppTheme.primaryText;
  static Color get secondaryText => AppTheme.secondaryText;
  static Color get primaryBackground => AppTheme.primaryBackground;
  static Color get secondaryBackground => AppTheme.secondaryBackground;
  static Color get accent1 => AppTheme.accent1;
  static Color get accent2 => AppTheme.accent2;
  static Color get accent3 => AppTheme.accent3;
  static Color get accent4 => AppTheme.accent4;
  static Color get success => AppTheme.success;
  static Color get warning => AppTheme.warning;
  static Color get error => AppTheme.error;
  static Color get info => AppTheme.info;

  static Color get primary => AppTheme.primary;
  static Color get darkMode800 => AppTheme.darkMode800;
  static Color get darkMode600 => AppTheme.darkMode600;
  static Color get neutral50 => AppTheme.neutral50;
  static Color get error300 => AppTheme.error300;

  static TextTheme get textTheme => AppTheme.textTheme;

  static TextStyle get displayLarge => AppTheme.displayLarge;
  static TextStyle get displayMedium => AppTheme.displayMedium;
  static TextStyle get displaySmall => AppTheme.displaySmall;
  static TextStyle get headlineLarge => AppTheme.headlineLarge;
  static TextStyle get headlineMedium => AppTheme.headlineMedium;
  static TextStyle get headlineSmall => AppTheme.headlineSmall;
  static TextStyle get titleLarge => AppTheme.titleLarge;
  static TextStyle get titleMedium => AppTheme.titleMedium;
  static TextStyle get titleSmall => AppTheme.titleSmall;
  static TextStyle get bodyLarge => AppTheme.bodyLarge;
  static TextStyle get bodyMedium => AppTheme.bodyMedium;
  static TextStyle get bodySmall => AppTheme.bodySmall;
  static TextStyle get labelLarge => AppTheme.labelLarge;
  static TextStyle get labelMedium => AppTheme.labelMedium;
  static TextStyle get labelSmall => AppTheme.labelSmall;

  static ThemeData get theme => AppTheme.theme;

  static dynamic of(BuildContext context) => AppTheme.of(context);
}
