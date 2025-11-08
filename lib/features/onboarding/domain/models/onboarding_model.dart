import 'package:flutter/material.dart';

class OnboardingPageModel extends ChangeNotifier {
  PageController? pageViewController;

  int get currentPage => pageViewController?.page?.round() ?? 0;

  @override
  void dispose() {
    pageViewController?.dispose();
    super.dispose();
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String? imagePath;

  OnboardingItem({
    required this.title,
    required this.description,
    this.imagePath,
  });
}
