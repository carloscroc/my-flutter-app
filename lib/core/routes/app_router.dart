import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/core/routes/route_names.dart';
import 'package:my_flutter_app/core/navigation/bottom_nav_scaffold.dart';
import 'package:my_flutter_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:my_flutter_app/features/home/presentation/pages/home_page.dart';
import 'package:my_flutter_app/features/auth/presentation/pages/welcome_signup_page.dart';
import 'package:my_flutter_app/features/auth/presentation/pages/welcome_login_page.dart';
import 'package:my_flutter_app/features/calendar/presentation/pages/calendar_detail_page.dart';
import 'package:my_flutter_app/features/workouts/presentation/pages/workout_page.dart';
import 'package:my_flutter_app/features/meals/presentation/pages/meals_page.dart';
import 'package:my_flutter_app/features/community/presentation/pages/community_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.onboarding,
    routes: [
      // Onboarding and Auth routes (outside bottom nav)
      GoRoute(
        path: RouteNames.onboarding,
        name: 'OnboardingPage',
        builder: (context, state) => const OnboardingPageWidget(),
      ),
      GoRoute(
        path: RouteNames.welcomeSignup,
        name: 'WelcomeSignUpPage',
        builder: (context, state) => const WelcomeSignUpPageWidget(),
      ),
      GoRoute(
        path: RouteNames.welcomeLogin,
        name: 'WelcomeLoginPage',
        builder: (context, state) => const WelcomeLoginPageWidget(),
      ),

      // Main app with bottom navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavScaffold(navigationShell: navigationShell);
        },
        branches: [
          // Home Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.home,
                name: 'HomePage',
                builder: (context, state) => const HomePageWidget(),
                routes: [
                  // Calendar detail as a sub-route of home
                  GoRoute(
                    path: 'calendar-detail',
                    name: 'CalendarDetailPage',
                    builder: (context, state) {
                      final extra = state.extra as Map<String, dynamic>?;
                      final initialDate = extra?['initialDate'] as DateTime?;
                      return CalendarDetailPage(initialDate: initialDate);
                    },
                  ),
                ],
              ),
            ],
          ),

          // Workouts Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.workouts,
                name: 'WorkoutPage',
                builder: (context, state) => const WorkoutPageWidget(),
              ),
            ],
          ),

          // Meals Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.meals,
                name: 'MealsPage',
                builder: (context, state) => const MealsPageWidget(),
              ),
            ],
          ),

          // Community Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.community,
                name: 'CommunityPage',
                builder: (context, state) => const CommunityPageWidget(),
              ),
            ],
          ),
        ],
      ),

      // Redirect for legacy home page route
      GoRoute(
        path: RouteNames.homePage,
        redirect: (context, state) => RouteNames.home,
      ),
    ],
    errorBuilder: (context, state) => const HomePageWidget(),
  );
}
