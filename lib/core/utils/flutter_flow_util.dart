import 'package:flutter/material.dart';

class FlutterFlowUtil {
  /// Navigate to a route
  static Future<T?> navigateTo<T>(
    BuildContext context,
    String routeName, {
    Map<String, dynamic>? params,
  }) {
    return Navigator.pushNamed(context, routeName, arguments: params);
  }

  /// Replace current route
  static Future<T?> replaceTo<T>(
    BuildContext context,
    String routeName, {
    Map<String, dynamic>? params,
  }) {
    return Navigator.pushReplacementNamed(context, routeName, arguments: params);
  }

  /// Pop current route
  static void pop(BuildContext context, [dynamic result]) {
    Navigator.pop(context, result);
  }

  /// Check if value is null or empty
  static bool isNullOrEmpty(dynamic value) {
    if (value == null) return true;
    if (value is String) return value.trim().isEmpty;
    if (value is List) return value.isEmpty;
    if (value is Map) return value.isEmpty;
    return false;
  }

  /// Format date
  static String formatDate(DateTime? date, {String format = 'yyyy-MM-dd'}) {
    if (date == null) return '';
    // Simple format implementation
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  /// Show snackbar
  static void showSnackbar(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        backgroundColor: backgroundColor,
      ),
    );
  }

  /// Validate email
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  /// Hide keyboard
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
