import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../presentation/auth/login_page.dart';
import '../presentation/features/home/home_page.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/featured',
        builder: (context, state) => Scaffold(appBar: AppBar(title: Text(AppLocalizations.of(context)!.featuredWorkouts)), body: Center(child: Text(AppLocalizations.of(context)!.featuredWorkouts))),
      ),
      GoRoute(
        path: '/meditative',
        builder: (context, state) => Scaffold(appBar: AppBar(title: Text(AppLocalizations.of(context)!.meditativeMornings)), body: Center(child: Text(AppLocalizations.of(context)!.meditativeMornings))),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const Scaffold(appBar: AppBar(title: Text('Notifications')), body: Center(child: Text('Notifications'))),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const Scaffold(appBar: AppBar(title: Text('Search')), body: Center(child: Text('Search'))),
      ),
      GoRoute(
        path: '/assessment',
        builder: (context, state) => const Scaffold(appBar: AppBar(title: Text('Assessment')), body: Center(child: Text('Assessment'))),
      ),
    ],
  );
}
