import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/themes/app_theme.dart';
import 'src/routes/go_router_setup.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = createRouter();
    return MaterialApp.router(
      title: 'My Flutter App',
      theme: AppTheme.light(),
      routerConfig: router,
    );
  }
}
