import 'package:flutter/material.dart';

class FlutterFlowTheme {
  final BuildContext _context;
  FlutterFlowTheme._(this._context);
  static FlutterFlowTheme of(BuildContext context) => FlutterFlowTheme._(context);

  TextStyle get title1 => Theme.of(_context).textTheme.headline6 ?? const TextStyle();
  TextStyle get bodyText1 => Theme.of(_context).textTheme.bodyText2 ?? const TextStyle();
  Color get primaryColor => Theme.of(_context).colorScheme.primary;
}
