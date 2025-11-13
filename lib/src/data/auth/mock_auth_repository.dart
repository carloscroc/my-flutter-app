import 'dart:async';
import '../models/user.dart';
import 'auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  UserModel? _user;
  final _controller = StreamController<UserModel?>.broadcast();

  MockAuthRepository() {
    // start with no user
    _controller.add(null);
  }

  @override
  UserModel? get currentUser => _user;

  @override
  Stream<UserModel?> authStateChanges() => _controller.stream;

  @override
  Future<UserModel?> signIn({required String email, required String password}) async {
    // simple mock credential check
    await Future.delayed(const Duration(milliseconds: 500));
    if (email == 'test@local' && password == 'password123') {
      _user = UserModel(id: 'u1', email: email, displayName: 'Test User');
      _controller.add(_user);
      return _user;
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _user = null;
    _controller.add(null);
  }

  void dispose() {
    _controller.close();
  }
}
