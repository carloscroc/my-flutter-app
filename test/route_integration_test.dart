import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/src/routes/go_router_setup.dart';

void main() {
  test('Router contains expected named routes', () {
    final router = createRouter();

    bool hasHome = router.routes.any((r) => r is GoRoute && r.name == 'HomePage');
    bool hasFeatured = router.routes.any((r) => r is GoRoute && r.name == 'FeaturedWorkoutsPageWidget');
    bool hasWelcomeSignup = router.routes.any((r) => r is GoRoute && r.name == 'WelcomeSignUpPageWidget');

    expect(hasHome, isTrue);
    expect(hasFeatured, isTrue);
    expect(hasWelcomeSignup, isTrue);
  });
}
