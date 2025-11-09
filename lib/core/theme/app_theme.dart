import 'package:flutter/material.dart';
import 'flutter_flow_theme.dart';

class AppTheme {
  /// Preserve the existing named constructor for light theme
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color(0xFF6750A4),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16),
      ),
    );
  }

  // Adapter getters forwarding to FlutterFlowTheme so callers can use AppTheme
  static Color get primaryColor => FlutterFlowTheme.primaryColor;
  static Color get secondaryColor => FlutterFlowTheme.secondaryColor;
  static Color get tertiaryColor => FlutterFlowTheme.tertiaryColor;
  static Color get alternate => FlutterFlowTheme.alternate;
  static Color get primaryText => FlutterFlowTheme.primaryText;
  static Color get secondaryText => FlutterFlowTheme.secondaryText;
  static Color get primaryBackground => FlutterFlowTheme.primaryBackground;
  static Color get secondaryBackground => FlutterFlowTheme.secondaryBackground;
  static Color get accent1 => FlutterFlowTheme.accent1;
  static Color get accent2 => FlutterFlowTheme.accent2;
  static Color get accent3 => FlutterFlowTheme.accent3;
  static Color get accent4 => FlutterFlowTheme.accent4;
  static Color get success => FlutterFlowTheme.success;
  static Color get warning => FlutterFlowTheme.warning;
  static Color get error => FlutterFlowTheme.error;
  static Color get info => FlutterFlowTheme.info;

  static Color get primary => FlutterFlowTheme.primary;
  static Color get darkMode800 => FlutterFlowTheme.darkMode800;
  static Color get darkMode600 => FlutterFlowTheme.darkMode600;
  static Color get neutral50 => FlutterFlowTheme.neutral50;
  static Color get error300 => FlutterFlowTheme.error300;

  static TextTheme get textTheme => FlutterFlowTheme.textTheme;

  static TextStyle get displayLarge => FlutterFlowTheme.displayLarge;
  static TextStyle get displayMedium => FlutterFlowTheme.displayMedium;
  static TextStyle get displaySmall => FlutterFlowTheme.displaySmall;
  static TextStyle get headlineLarge => FlutterFlowTheme.headlineLarge;
  static TextStyle get headlineMedium => FlutterFlowTheme.headlineMedium;
  static TextStyle get headlineSmall => FlutterFlowTheme.headlineSmall;
  static TextStyle get titleLarge => FlutterFlowTheme.titleLarge;
  static TextStyle get titleMedium => FlutterFlowTheme.titleMedium;
  static TextStyle get titleSmall => FlutterFlowTheme.titleSmall;
  static TextStyle get bodyLarge => FlutterFlowTheme.bodyLarge;
  static TextStyle get bodyMedium => FlutterFlowTheme.bodyMedium;
  static TextStyle get bodySmall => FlutterFlowTheme.bodySmall;
  static TextStyle get labelLarge => FlutterFlowTheme.labelLarge;
  static TextStyle get labelMedium => FlutterFlowTheme.labelMedium;
  static TextStyle get labelSmall => FlutterFlowTheme.labelSmall;

  static ThemeData get theme => FlutterFlowTheme.theme;

  // Compatibility instance-based access returning a public adapter type
  static AppThemeData of(BuildContext context) =>
      AppThemeData._fromFlutterFlow(FlutterFlowTheme.of(context));
}

/// Public adapter that exposes the subset of theme properties used across the app.
class AppThemeData {
  final dynamic _ffData;

  AppThemeData._fromFlutterFlow(this._ffData);

  Color get primaryBackground => _ffData.primaryBackground;
  Color get primaryText => _ffData.primaryText;
  Color get primary => _ffData.primary;
  Color get darkMode800 => _ffData.darkMode800;
  Color get darkMode600 => _ffData.darkMode600;
  Color get neutral50 => _ffData.neutral50;
  Color get error300 => _ffData.error300;

  TextStyle get paragraphP1SemiBold => _ffData.paragraphP1SemiBold;
  TextStyle get desktopHeadingH6Bold => _ffData.desktopHeadingH6Bold;
  TextStyle get mobileHeadingH6Medium => _ffData.mobileHeadingH6Medium;
}
