import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_app/src/presentation/features/home/home_page.dart';

void main() {
  testWidgets('HomePage renders without errors', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.textContaining('Good Morning'), findsWidgets);
  });
}
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_app/src/presentation/features/home/home_page.dart';

void main() {
  testWidgets('Home page basic sections render', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: HomePage())));

    // Allow initial frames
    await tester.pumpAndSettle();

    // Find localized strings (we look for parts of the strings to avoid needing generated localization in test environment)
    expect(find.textContaining('Good Morning'), findsOneWidget);
    expect(find.textContaining('Featured'), findsOneWidget);
    expect(find.textContaining('Meditative'), findsOneWidget);
    expect(find.textContaining('Assessment'), findsOneWidget);
  });
}
