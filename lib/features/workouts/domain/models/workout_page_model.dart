import 'package:flutter/material.dart';
import '../../../../data/models/workout_model.dart';
import '../../../../data/models/challenge_model.dart';

class WorkoutPageModel extends ChangeNotifier {
  // Selected category filter
  String _selectedCategory = 'All';
  String get selectedCategory => _selectedCategory;

  // Workout data
  List<WorkoutModel> _allWorkouts = [];
  List<WorkoutModel> _featuredWorkouts = [];
  List<WorkoutModel> _homeWorkouts = [];
  List<ChallengeModel> _challenges = [];

  // Loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Getters for workout lists
  List<WorkoutModel> get allWorkouts => _allWorkouts;
  List<WorkoutModel> get featuredWorkouts => _featuredWorkouts;
  List<WorkoutModel> get homeWorkouts => _homeWorkouts;
  List<ChallengeModel> get challenges => _challenges;

  // Filtered workouts based on selected category
  List<WorkoutModel> get filteredWorkouts {
    if (_selectedCategory == 'All') {
      return _allWorkouts;
    }
    return _allWorkouts.where((workout) {
      return workout.categories?.contains(_selectedCategory) ?? false;
    }).toList();
  }

  WorkoutPageModel() {
    _loadData();
  }

  // Initialize and load mock data
  void _loadData() {
    _isLoading = true;
    notifyListeners();

    // Simulate network delay
    Future.delayed(const Duration(milliseconds: 500), () {
      _allWorkouts = MockWorkoutData.getAllWorkouts();
      _featuredWorkouts = MockWorkoutData.getFeaturedWorkouts();
      _homeWorkouts = MockWorkoutData.getHomeWorkouts();
      _challenges = MockChallengeData.getAllChallenges();

      _isLoading = false;
      notifyListeners();
    });
  }

  // Update selected category
  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  // Get workouts by difficulty
  List<WorkoutModel> getWorkoutsByDifficulty(String difficulty) {
    return _allWorkouts.where((w) => w.difficulty == difficulty).toList();
  }

  // Get workouts by body focus
  List<WorkoutModel> getWorkoutsByBodyFocus(String bodyFocus) {
    return _allWorkouts.where((w) => w.bodyFocus == bodyFocus).toList();
  }

  // Get workouts by equipment
  List<WorkoutModel> getWorkoutsByEquipment(String equipment) {
    return _allWorkouts.where((w) => w.equipment == equipment).toList();
  }
}
