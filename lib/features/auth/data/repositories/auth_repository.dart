import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_flutter_app/features/auth/domain/services/firebase_auth_util.dart';

class AuthRepository {
  // Sign in with email and password
  Future<User?> signIn(String email, String password) async {
    final credential = await AuthUtil.signInWithEmail(
      email: email,
      password: password,
    );
    return credential?.user;
  }

  // Sign up with email and password
  Future<User?> signUp(String email, String password) async {
    final credential = await AuthUtil.signUpWithEmail(
      email: email,
      password: password,
    );
    return credential?.user;
  }

  // Sign in as guest
  Future<User?> signInAsGuest() async {
    final credential = await AuthUtil.signInAnonymously();
    return credential?.user;
  }

  // Sign out
  Future<void> signOut() async {
    await AuthUtil.signOut();
  }

  // Get current user
  User? getCurrentUser() {
    return AuthUtil.currentUser;
  }

  // Check if logged in
  bool isLoggedIn() {
    return AuthUtil.isLoggedIn;
  }
}
