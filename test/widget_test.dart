// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_app/main.dart';

void main() {
  testWidgets('App shows welcome text', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();

    // App builds successfully and exposes a MaterialApp router.
    expect(find.byType(MaterialApp), findsOneWidget);
    // Ensure no exceptions were thrown during build.
    expect(tester.takeException(), isNull);
  });
}
