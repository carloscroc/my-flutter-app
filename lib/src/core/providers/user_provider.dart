import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Simple provider for the current user's display name.
/// Replace with a real profile/auth provider when available.
final userNameProvider = StateProvider<String>((ref) => 'John');
