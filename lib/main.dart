import 'package:flutter/material.dart';
import 'src/themes/app_theme.dart';
import 'src/routes/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: AppTheme.light(),
      onGenerateRoute: AppRoutes.generate,
      initialRoute: '/',
    );
  }
}
