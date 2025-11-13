import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_app/src/data/repositories/home_repository.dart';
import 'package:my_flutter_app/src/data/repositories/mock_home_repository.dart';
import 'package:my_flutter_app/src/data/models/workout.dart';
import 'package:my_flutter_app/src/data/models/meditative_morning.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final repo = MockHomeRepository();
  ref.onDispose(() => repo.dispose());
  return repo;
});

final featuredWorkoutsProvider = StreamProvider.autoDispose<List<Workout>>((ref) {
  final repo = ref.watch(homeRepositoryProvider);
  return repo.watchFeaturedWorkouts();
});

final meditativeMorningsProvider = StreamProvider.autoDispose<List<MeditativeMorning>>((ref) {
  final repo = ref.watch(homeRepositoryProvider);
  return repo.watchMeditativeMornings();
});
