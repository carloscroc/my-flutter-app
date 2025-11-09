import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:my_flutter_app/core/theme/app_theme.dart';
import 'package:my_flutter_app/core/routes/route_names.dart';
import 'package:my_flutter_app/features/onboarding/domain/models/onboarding_model.dart';
import 'package:my_flutter_app/features/onboarding/presentation/widgets/onboarding_item_widget.dart';
import 'package:my_flutter_app/features/onboarding/presentation/widgets/primary_button_widget.dart';
import 'package:my_flutter_app/features/onboarding/presentation/widgets/secondary_button_widget.dart';
import 'package:my_flutter_app/features/auth/data/repositories/auth_repository.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class OnboardingPageWidget extends StatefulWidget {
  const OnboardingPageWidget({super.key});

  static String routeName = 'OnboardingPage';
  static String routePath = '/onboardingPage';

  @override
  State<OnboardingPageWidget> createState() => _OnboardingPageWidgetState();
}

class _OnboardingPageWidgetState extends State<OnboardingPageWidget> {
  late OnboardingPageModel _model;
  final _authRepository = AuthRepository();
  bool _isLoading = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Onboarding data
  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: 'Welcome to Your Wellness Journey',
      description:
          'Discover personalized workouts and meditation sessions designed just for you.',
    ),
    OnboardingItem(
      title: 'Track Your Progress',
      description:
          'Monitor your fitness goals and celebrate your achievements along the way.',
    ),
    OnboardingItem(
      title: 'Find Your Balance',
      description:
          'Combine physical exercise with mindfulness for complete well-being.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _model = OnboardingPageModel();
    _model.pageViewController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _handleGuestLogin() async {
    setState(() => _isLoading = true);

    try {
      // DEBUG bypass: in debug builds go straight to home without Firebase
      if (kDebugMode) {
        await Future.delayed(const Duration(milliseconds: 250)); // small UX delay
        if (mounted) {
          context.go(RouteNames.home);
        }
        return;
      }

      // Production/dev with Firebase: existing behavior
      final user = await _authRepository.signInAsGuest();
      if (user != null && mounted) {
        context.go(RouteNames.home);
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Guest login failed. Please try again.')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: AppTheme.primaryBackground,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                            child: PageView.builder(
                              controller: _model.pageViewController,
                              scrollDirection: Axis.horizontal,
                              itemCount: onboardingItems.length,
                              itemBuilder: (context, index) {
                                final item = onboardingItems[index];
                                return OnboardingItemWidget(
                                  key: Key('onboarding_$index'),
                                  title: item.title,
                                  description: item.description,
                                  imagePath: item.imagePath,
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 1),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: SmoothPageIndicator(
                                controller: _model.pageViewController ??
                                    PageController(
                                        initialPage: max(
                                            0, min(0, onboardingItems.length - 1))),
                                count: onboardingItems.length,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) async {
                                  await _model.pageViewController!.animateToPage(
                                    i,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                  setState(() {});
                                },
                                effect: SlideEffect(
                                  spacing: 8,
                                  radius: 2,
                                  dotWidth: 90,
                                  dotHeight: 4,
                                  dotColor: AppTheme.alternate,
                                  activeDotColor: AppTheme.primaryColor,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Get Started Button
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                    child: PrimaryButtonWidget(
                      text: 'Get Started',
                      onPressed: () {
                        context.go(RouteNames.welcomeSignup);
                      },
                    ),
                  ),

                  // Log In Button
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: SecondaryButtonWidget(
                      text: 'Log in',
                      onPressed: () {
                        context.go(RouteNames.welcomeLogin);
                      },
                    ),
                  ),

                  // Join as Guest Button
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                    child: TextButton(
                      onPressed: _isLoading ? null : _handleGuestLogin,
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(
                              'Join as Guest',
                              style: AppTheme.bodyLarge.copyWith(
                                color: AppTheme.secondaryText,
                              ),
                            ),
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
}
