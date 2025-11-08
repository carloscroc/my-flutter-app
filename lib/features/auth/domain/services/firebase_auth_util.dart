import 'package:firebase_auth/firebase_auth.dart';

class AuthUtil {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  static User? get currentUser => _auth.currentUser;

  // Get current user UID
  static String get currentUserUid => currentUser?.uid ?? '';

  // Get current user email
  static String get currentUserEmail => currentUser?.email ?? '';

  // Get current user display name
  static String get currentUserDisplayName => currentUser?.displayName ?? '';

  // Check if user is logged in
  static bool get isLoggedIn => currentUser != null;

  // Sign in with email and password
  static Future<UserCredential?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Sign in error: $e');
      return null;
    }
  }

  // Sign up with email and password
  static Future<UserCredential?> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Sign up error: $e');
      return null;
    }
  }

  // Sign in anonymously (for guest login)
  static Future<UserCredential?> signInAnonymously() async {
    try {
      return await _auth.signInAnonymously();
    } catch (e) {
      print('Anonymous sign in error: $e');
      return null;
    }
  }

  // Sign out
  static Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Sign out error: $e');
    }
  }

  // Reset password
  static Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('Password reset error: $e');
    }
  }

  // Update display name
  static Future<void> updateDisplayName(String displayName) async {
    try {
      await currentUser?.updateDisplayName(displayName);
    } catch (e) {
      print('Update display name error: $e');
    }
  }

  // Update photo URL
  static Future<void> updatePhotoUrl(String photoUrl) async {
    try {
      await currentUser?.updatePhotoURL(photoUrl);
    } catch (e) {
      print('Update photo URL error: $e');
    }
  }
}
