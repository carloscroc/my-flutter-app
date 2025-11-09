export 'app_util.dart';

import 'package:flutter/material.dart';
import 'app_util.dart';

/// Compatibility adapter so existing code using `FlutterFlowUtil` continues to work.
/// Delegates all static calls to `AppUtil`.
class FlutterFlowUtil {
  static Future<T?> navigateTo<T>(
    BuildContext context,
    String routeName, {
    Map<String, dynamic>? params,
  }) =>
      AppUtil.navigateTo<T>(context, routeName, params: params);

  static Future<T?> replaceTo<T>(
    BuildContext context,
    String routeName, {
    Map<String, dynamic>? params,
  }) =>
      AppUtil.replaceTo<T>(context, routeName, params: params);

  static void pop(BuildContext context, [dynamic result]) =>
      AppUtil.pop(context, result);

  static bool isNullOrEmpty(dynamic value) => AppUtil.isNullOrEmpty(value);

  static String formatDate(DateTime? date, {String format = 'yyyy-MM-dd'}) =>
      AppUtil.formatDate(date, format: format);

  static void showSnackbar(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
  }) =>
      AppUtil.showSnackbar(
        context,
        message,
        duration: duration,
        backgroundColor: backgroundColor,
      );

  static bool isValidEmail(String email) => AppUtil.isValidEmail(email);

  static void hideKeyboard(BuildContext context) => AppUtil.hideKeyboard(context);
}
