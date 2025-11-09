import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterFlowTheme {
  static const Color primaryColor = Color(0xFFC7B5A7);
  static const Color secondaryColor = Color(0xFF8B6B5A);
  static const Color tertiaryColor = Color(0xFF7D5A4A);
  static const Color alternate = Color(0xFFF7F3F0);
  static const Color primaryText = Color(0xFF1C1B1F);
  static const Color secondaryText = Color(0xFF6B6056);
  static const Color primaryBackground = Color(0xFFFFF9F6);
  static const Color secondaryBackground = Color(0xFFF2EDE9);
  static const Color accent1 = Color(0xFFFFF1E6);
  static const Color accent2 = Color(0xFFFFD9BC);
  static const Color accent3 = Color(0xFFD1B7AA);
  static const Color accent4 = Color(0xFFACA38A);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFB3261E);
  static const Color info = Color(0xFF2196F3);

  // Additional colors for profile page
  static const Color primary = primaryColor;
  static const Color darkMode800 = Color(0xFF1C1C1E);
  static const Color darkMode600 = Color(0xFF2C2C2E);
  static const Color neutral50 = Color(0xFFFAFAFA);
  static const Color error300 = Color(0xFFEF5350);

  // Context-based theme access (FlutterFlow compatibility)
  static _FlutterFlowThemeData of(BuildContext context) {
    return _FlutterFlowThemeData._instance;
  }

  static TextTheme get textTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get displayLarge => GoogleFonts.poppins(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: primaryText,
      );

  static TextStyle get displayMedium => GoogleFonts.poppins(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: primaryText,
      );

  static TextStyle get displaySmall => GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: primaryText,
      );

  static TextStyle get headlineLarge => GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: primaryText,
      );

  static TextStyle get headlineMedium => GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: primaryText,
      );

  static TextStyle get headlineSmall => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: primaryText,
      );

  static TextStyle get titleLarge => GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: primaryText,
      );

  static TextStyle get titleMedium => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: primaryText,
      );

  static TextStyle get titleSmall => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: primaryText,
      );

  static TextStyle get bodyLarge => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: primaryText,
      );

  static TextStyle get bodyMedium => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: primaryText,
      );

  static TextStyle get bodySmall => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: secondaryText,
      );

  static TextStyle get labelLarge => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: primaryText,
      );

  static TextStyle get labelMedium => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: primaryText,
      );

  static TextStyle get labelSmall => GoogleFonts.poppins(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: primaryText,
      );

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: primaryColor,
        scaffoldBackgroundColor: primaryBackground,
        textTheme: textTheme,
      );
}

/// Instance-based theme data for FlutterFlow compatibility
class _FlutterFlowThemeData {
  static final _FlutterFlowThemeData _instance = _FlutterFlowThemeData._();
  _FlutterFlowThemeData._();

  // Color properties
  Color get primaryBackground => FlutterFlowTheme.primaryBackground;
  Color get primaryText => FlutterFlowTheme.primaryText;
  Color get primary => FlutterFlowTheme.primary;
  Color get darkMode800 => FlutterFlowTheme.darkMode800;
  Color get darkMode600 => FlutterFlowTheme.darkMode600;
  Color get neutral50 => FlutterFlowTheme.neutral50;
  Color get error300 => FlutterFlowTheme.error300;

  // Text styles for profile page
  TextStyle get paragraphP1SemiBold => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: FlutterFlowTheme.primaryText,
      );

  TextStyle get desktopHeadingH6Bold => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: FlutterFlowTheme.primaryText,
      );

  TextStyle get mobileHeadingH6Medium => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: FlutterFlowTheme.primaryText,
      );
}
