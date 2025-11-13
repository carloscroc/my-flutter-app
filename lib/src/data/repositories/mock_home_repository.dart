import 'dart:async';
import '../models/workout.dart';
import '../models/meditative_morning.dart';
import 'home_repository.dart';

class MockHomeRepository implements HomeRepository {
  final _featuredController = StreamController<List<Workout>>.broadcast();
  final _allController = StreamController<List<Workout>>.broadcast();
  final _medController = StreamController<List<MeditativeMorning>>.broadcast();

  MockHomeRepository() {
    // emit initial mock data
    _emitInitial();
  }

  void _emitInitial() {
    final featured = [
      Workout(id: 'w1', name: 'Full Body Blast', photoUrl: 'https://picsum.photos/seed/w1/600/360', isFeatured: true, shortDescription: 'A short full body routine'),
      Workout(id: 'w2', name: 'Quick HIIT', photoUrl: 'https://picsum.photos/seed/w2/600/360', isFeatured: true, shortDescription: 'High intensity interval training'),
    ];
    final all = [
      ...featured,
      Workout(id: 'w3', name: 'Yoga Flow', photoUrl: 'https://picsum.photos/seed/w3/600/360', isFeatured: false),
    ];
    final meds = [
      MeditativeMorning(id: 'm1', name: 'Breathing Focus', durationMinutes: 5),
      MeditativeMorning(id: 'm2', name: 'Mindful Stretch', durationMinutes: 8),
    ];

    _featuredController.add(featured);
    _allController.add(all);
    _medController.add(meds);
  }

  @override
  Stream<List<Workout>> watchFeaturedWorkouts() => _featuredController.stream;

  @override
  Stream<List<Workout>> watchAllWorkouts() => _allController.stream;

  @override
  Stream<List<MeditativeMorning>> watchMeditativeMornings() => _medController.stream;

  void dispose() {
    _featuredController.close();
    _allController.close();
    _medController.close();
  }
}
