import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/theme/flutter_flow_theme.dart';
import 'package:my_flutter_app/core/routes/app_router.dart';
import 'package:my_flutter_app/data/models/backend/backend.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase (will handle if already initialized)
  await FirebaseBackend.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Flutter App',
      theme: FlutterFlowTheme.theme,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
