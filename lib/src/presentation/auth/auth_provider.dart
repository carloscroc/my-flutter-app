import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/auth/auth_repository.dart';
import '../../data/auth/mock_auth_repository.dart';
import '../../data/models/user.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final repo = MockAuthRepository();
  ref.onDispose(() => repo.dispose());
  return repo;
});

class AuthController extends StateNotifier<UserModel?> {
  final AuthRepository _repo;
  AuthController(this._repo) : super(_repo.currentUser) {
    _repo.authStateChanges().listen((u) => state = u);
  }

  Future<bool> signIn(String email, String password) async {
    final u = await _repo.signIn(email: email, password: password);
    state = u;
    return u != null;
  }

  Future<void> signOut() async {
    await _repo.signOut();
    state = null;
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, UserModel?>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return AuthController(repo);
});

final isAuthenticatedProvider = Provider<bool>((ref) => ref.watch(authControllerProvider) != null);
