import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/core/routes/route_names.dart';
import 'package:my_flutter_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:my_flutter_app/features/home/presentation/pages/home_page.dart';
import 'package:my_flutter_app/features/auth/presentation/pages/welcome_signup_page.dart';
import 'package:my_flutter_app/features/auth/presentation/pages/welcome_login_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.onboarding,
    routes: [
      GoRoute(
        path: RouteNames.onboarding,
        name: 'OnboardingPage',
        builder: (context, state) => const OnboardingPageWidget(),
      ),
      GoRoute(
        path: RouteNames.home,
        name: 'HomePage',
        builder: (context, state) => const HomePageWidget(),
      ),
      GoRoute(
        path: RouteNames.homePage,
        redirect: (context, state) => RouteNames.home,
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
    ],
    errorBuilder: (context, state) => const HomePageWidget(),
  );
}
