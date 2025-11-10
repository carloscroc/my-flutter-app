import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Consolidated application theme.
///
/// This file now contains the canonical theme implementation. It replaces
/// the previous split implementation and removes the separate
/// `flutter_flow_theme.dart` file so callers use `AppTheme`/`AppTheme.of`.
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

  // Color definitions (migrated from the former FlutterFlow theme)
  // Design-system tokens (styles-new.md)
  static const Color primaryColor = Color(0xFFFF8C42); // warm orange accent
  static const Color secondaryColor = Color(0xFF26C6A6); // calm teal (success)
  static const Color tertiaryColor = Color(0xFF7D5A4A);
  static const Color alternate = Color(0xFFF7F3F0);
  static const Color primaryText = Color(0xFF111315); // deep text
  static const Color secondaryText = Color(0xFF9E9E9E); // muted gray
  static const Color primaryBackground = Color(0xFFFBFBFA); // warm light
  static const Color secondaryBackground = Color(0xFFF2EDE9);
  static const Color accent1 = Color(0xFFFFF1E6);
  static const Color accent2 = Color(0xFFFFD9BC);
  static const Color accent3 = Color(0xFFD1B7AA);
  static const Color accent4 = Color(0xFFACA38A);
  static const Color success = Color(0xFF26C6A6);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFB3261E);
  static const Color info = Color(0xFF2196F3);

  // Additional colors
  static const Color primary = primaryColor;
  static const Color darkMode800 = Color(0xFF1C1C1E);
  static const Color darkMode600 = Color(0xFF2C2C2E);
  static const Color neutral50 = Color(0xFFFAFAFA);
  static const Color error300 = Color(0xFFEF5350);

  // Text theme helpers
  static TextTheme get textTheme => GoogleFonts.interTextTheme().copyWith(
        headlineLarge: GoogleFonts.inter(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: primaryText,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: primaryText,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: primaryText,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: secondaryText,
        ),
      );

  // Metric display style (largest metric emphasis)
  static TextStyle get metricDisplay => GoogleFonts.inter(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: primaryColor,
      );

  // Backwards-compatible named styles used across the codebase.
  static TextStyle get titleLarge => textTheme.headlineLarge ?? const TextStyle();
  static TextStyle get titleMedium => textTheme.headlineMedium ?? const TextStyle();
  static TextStyle get titleSmall => textTheme.headlineSmall ?? const TextStyle();
  static TextStyle get bodySmall => textTheme.bodyMedium ?? const TextStyle();

  // Additional compatibility shims for older callers
  static TextStyle get displayLarge => textTheme.headlineLarge ?? const TextStyle();
  static TextStyle get displayMedium => textTheme.headlineMedium ?? const TextStyle();
  static TextStyle get displaySmall => textTheme.headlineSmall ?? const TextStyle();
  static TextStyle get headlineLarge => textTheme.headlineLarge ?? const TextStyle();
  static TextStyle get headlineMedium => textTheme.headlineMedium ?? const TextStyle();
  static TextStyle get headlineSmall => textTheme.headlineSmall ?? const TextStyle();
  static TextStyle get bodyLarge => textTheme.bodyLarge ?? const TextStyle();
  static TextStyle get bodyMedium => textTheme.bodyMedium ?? const TextStyle();
  static TextStyle get labelLarge => textTheme.labelLarge ?? const TextStyle();
  static TextStyle get labelMedium => textTheme.labelMedium ?? const TextStyle();
  static TextStyle get labelSmall => textTheme.labelSmall ?? const TextStyle();

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        scaffoldBackgroundColor: primaryBackground,
        textTheme: textTheme,
      );

  // Instance-like access for the subset of properties used across widgets.
  // Returning a stable singleton keeps compatibility with prior code that
  // expected `AppTheme.of(context)` to provide fields like
  // `desktopHeadingH6Bold`.
  static AppThemeData of(BuildContext context) => AppThemeData._instance;
}

/// Spacing and common dimension tokens.
class AppSpacing {
  AppSpacing._();
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double page = 48.0;
}

/// Card and elevation tokens.
class AppTokens {
  AppTokens._();
  static const double cardRadius = 14.0;
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color.fromRGBO(16, 16, 18, 0.06),
      offset: Offset(0, 6),
      blurRadius: 20,
    ),
  ];
  static const double inputHeight = 56.0;
  static const double inputRadius = 12.0;
}

/// Instance-backed theme adapter exposing commonly used fields.
class AppThemeData {
  static final AppThemeData _instance = AppThemeData._();
  AppThemeData._();

  Color get primaryBackground => AppTheme.primaryBackground;
  Color get primaryText => AppTheme.primaryText;
  Color get primary => AppTheme.primary;
  Color get darkMode800 => AppTheme.darkMode800;
  Color get darkMode600 => AppTheme.darkMode600;
  Color get neutral50 => AppTheme.neutral50;
  Color get error300 => AppTheme.error300;

  TextStyle get paragraphP1SemiBold => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppTheme.primaryText,
      );

  TextStyle get desktopHeadingH6Bold => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppTheme.primaryText,
      );

  TextStyle get mobileHeadingH6Medium => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppTheme.primaryText,
      );
}
