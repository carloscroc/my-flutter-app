import 'package:flutter/widgets.dart';

T createModel<T>(BuildContext context, T Function() creator) {
  return creator();
}

/// Returns the child directly. This is a noop shim for FlutterFlow's
/// `wrapWithModel` calls so imported pages compile without the FlutterFlow
/// runtime. If you need to maintain model lifecycle, replace with an adapter.
Widget wrapWithModel({required Widget child, dynamic? model, bool useState = false}) {
  return child;
}

// Add other small utility shims as needed by imported files.
