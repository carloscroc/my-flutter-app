import 'package:flutter/material.dart';
import 'home.page.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

/// Light wrapper so the original `HomePageWidget` remains untouched
/// and we introduce a new `HomeScreenWidget` entry point.
class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  static String routeName = 'HomeScreen';
  static String routePath = '/homeScreen';

  @override
  Widget build(BuildContext context) {
    // Reuse the generated HomePageWidget implementation.
    return const HomePageWidget();
  }
}
