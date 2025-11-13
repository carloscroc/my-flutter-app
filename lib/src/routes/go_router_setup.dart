import 'package:go_router/go_router.dart';
import '../presentation/auth/login_page.dart';
import '../presentation/features/home/home_page.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    ],
  );
}
