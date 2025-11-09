import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/meals_page_model.dart';

class MealsPageWidget extends StatefulWidget {
  const MealsPageWidget({super.key});

  static String routeName = 'MealsPage';
  static String routePath = '/meals';

  @override
  State<MealsPageWidget> createState() => _MealsPageWidgetState();
}

class _MealsPageWidgetState extends State<MealsPageWidget> {
  late MealsPageModel _model;

  @override
  void initState() {
    super.initState();
    _model = MealsPageModel();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      child: Scaffold(
        backgroundColor: AppTheme.primaryBackground,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.restaurant_menu,
                    size: 100,
                    color: AppTheme.primaryColor,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Meals',
                    style: AppTheme.headlineLarge.copyWith(
                      color: AppTheme.primaryText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Coming Soon',
                    style: AppTheme.titleMedium.copyWith(
                      color: AppTheme.secondaryText,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      'Discover healthy meal plans, recipes, and nutrition tracking to complement your fitness journey.',
                      textAlign: TextAlign.center,
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.secondaryText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        _buildFeatureItem('Meal Plans', Icons.calendar_today),
                        const SizedBox(height: 12),
                        _buildFeatureItem('Recipes', Icons.book),
                        const SizedBox(height: 12),
                        _buildFeatureItem('Nutrition Tracking', Icons.track_changes),
                        const SizedBox(height: 12),
                        _buildFeatureItem('Calorie Counter', Icons.local_fire_department),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: AppTheme.primaryColor,
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: AppTheme.bodyMedium.copyWith(
            color: AppTheme.primaryText,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
