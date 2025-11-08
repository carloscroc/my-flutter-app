import 'package:flutter/material.dart';
import 'package:my_flutter_app/core/theme/flutter_flow_theme.dart';

class OnboardingItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final String? imagePath;

  const OnboardingItemWidget({
    super.key,
    required this.title,
    required this.description,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null)
            Image.asset(
              imagePath!,
              height: 300,
              fit: BoxFit.contain,
            ),
          const SizedBox(height: 40),
          Text(
            title,
            style: FlutterFlowTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: FlutterFlowTheme.bodyLarge.copyWith(
              color: FlutterFlowTheme.secondaryText,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
