import '../models/user.dart';

abstract class AuthRepository {
  Future<UserModel?> signIn({required String email, required String password});
  Future<void> signOut();
  UserModel? get currentUser;
  Stream<UserModel?> authStateChanges();
}
