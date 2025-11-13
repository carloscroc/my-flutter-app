import '../models/workout.dart';
import '../models/meditative_morning.dart';

abstract class HomeRepository {
  Stream<List<Workout>> watchFeaturedWorkouts();
  Stream<List<Workout>> watchAllWorkouts();
  Stream<List<MeditativeMorning>> watchMeditativeMornings();
}
