import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/l10n/app_localizations.dart';
import '../presentation/auth/login_page.dart';
import '../presentation/features/home/home_page.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      // Login route. Name matches common FlutterFlow-generated welcome/login name.
      GoRoute(
        path: '/login',
        name: 'WelcomeLoginPageWidget',
        builder: (context, state) => const LoginPage(),
      ),
      // Onboarding and signup placeholders so imported code's named pushes resolve.
      GoRoute(
        path: '/onboarding',
        name: 'OnboardingPage',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/welcome-signup',
        name: 'WelcomeSignUpPageWidget',
        builder: (context, state) => const LoginPage(),
      ),

      // Primary home routes. Keep /home for existing usage and expose the
      // FlutterFlow-style name 'HomePage' on /homePage.
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/homePage',
        name: 'HomePage',
        builder: (context, state) => const HomePage(),
      ),

      GoRoute(
        path: '/featured',
        name: 'FeaturedWorkoutsPageWidget',
        builder: (context, state) => Scaffold(appBar: AppBar(title: Text(AppLocalizations.of(context)!.featuredWorkouts)), body: Center(child: Text(AppLocalizations.of(context)!.featuredWorkouts))),
      ),
      GoRoute(
        path: '/meditative',
        name: 'MeditativeMorningsPageWidget',
        builder: (context, state) => Scaffold(appBar: AppBar(title: Text(AppLocalizations.of(context)!.meditativeMornings)), body: Center(child: Text(AppLocalizations.of(context)!.meditativeMornings))),
      ),
      GoRoute(
        path: '/notifications',
        name: 'NotificationsPage',
        builder: (context, state) => Scaffold(appBar: AppBar(title: const Text('Notifications')), body: const Center(child: Text('Notifications'))),
      ),
      GoRoute(
        path: '/search',
        name: 'SearchPage',
        builder: (context, state) => Scaffold(appBar: AppBar(title: const Text('Search')), body: const Center(child: Text('Search'))),
      ),
      GoRoute(
        path: '/assessment',
        name: 'AssessmentPage',
        builder: (context, state) => Scaffold(appBar: AppBar(title: const Text('Assessment')), body: const Center(child: Text('Assessment'))),
      ),
    ],
  );
}
