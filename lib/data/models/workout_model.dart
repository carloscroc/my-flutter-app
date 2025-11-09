class WorkoutModel {
  final String id;
  final String name;
  final String photoUrl;
  final String? description;
  final int? duration; // in minutes
  final String? difficulty; // Beginner, Intermediate, Advanced
  final List<String>? categories; // Strength, Yoga, Stretching, etc.
  final String? equipment; // None, Kettlebell, Weights, etc.
  final String? bodyFocus; // Abs, Arms, Legs, Chest, etc.

  WorkoutModel({
    required this.id,
    required this.name,
    required this.photoUrl,
    this.description,
    this.duration,
    this.difficulty,
    this.categories,
    this.equipment,
    this.bodyFocus,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String,
      description: json['description'] as String?,
      duration: json['duration'] as int?,
      difficulty: json['difficulty'] as String?,
      categories: (json['categories'] as List<dynamic>?)?.cast<String>(),
      equipment: json['equipment'] as String?,
      bodyFocus: json['bodyFocus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'photoUrl': photoUrl,
      'description': description,
      'duration': duration,
      'difficulty': difficulty,
      'categories': categories,
      'equipment': equipment,
      'bodyFocus': bodyFocus,
    };
  }
}

// Mock data for testing
class MockWorkoutData {
  static List<WorkoutModel> getAllWorkouts() {
    return [
      WorkoutModel(
        id: '1',
        name: 'Morning Yoga Flow',
        photoUrl: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400&h=300&fit=crop',
        description: 'Start your day with energizing yoga poses',
        duration: 30,
        difficulty: 'Beginner',
        categories: ['Yoga'],
        equipment: 'None',
      ),
      WorkoutModel(
        id: '2',
        name: 'Full Body Strength',
        photoUrl: 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=400&h=300&fit=crop',
        description: 'Build strength with compound movements',
        duration: 45,
        difficulty: 'Intermediate',
        categories: ['Strength'],
        equipment: 'Weights',
        bodyFocus: 'Full Body',
      ),
      WorkoutModel(
        id: '3',
        name: 'Core & Abs Blast',
        photoUrl: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop',
        description: 'Sculpt and strengthen your core',
        duration: 20,
        difficulty: 'Beginner',
        categories: ['Strength'],
        equipment: 'None',
        bodyFocus: 'Abs',
      ),
      WorkoutModel(
        id: '4',
        name: 'Evening Stretch',
        photoUrl: 'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=400&h=300&fit=crop',
        description: 'Relax and unwind with gentle stretches',
        duration: 15,
        difficulty: 'Beginner',
        categories: ['Stretching'],
        equipment: 'None',
      ),
      WorkoutModel(
        id: '5',
        name: 'HIIT Cardio Burn',
        photoUrl: 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=400&h=300&fit=crop',
        description: 'High-intensity interval training',
        duration: 25,
        difficulty: 'Advanced',
        categories: ['Cardio'],
        equipment: 'None',
      ),
      WorkoutModel(
        id: '6',
        name: 'Upper Body Power',
        photoUrl: 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400&h=300&fit=crop',
        description: 'Build upper body strength',
        duration: 40,
        difficulty: 'Intermediate',
        categories: ['Strength'],
        equipment: 'Weights',
        bodyFocus: 'Arms',
      ),
      WorkoutModel(
        id: '7',
        name: 'Leg Day Essentials',
        photoUrl: 'https://images.unsplash.com/photo-1434682881908-b43d0467b798?w=400&h=300&fit=crop',
        description: 'Strengthen and tone your legs',
        duration: 35,
        difficulty: 'Intermediate',
        categories: ['Strength'],
        equipment: 'None',
        bodyFocus: 'Legs',
      ),
      WorkoutModel(
        id: '8',
        name: 'Kettlebell Workout',
        photoUrl: 'https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?w=400&h=300&fit=crop',
        description: 'Full body kettlebell routine',
        duration: 30,
        difficulty: 'Beginner',
        categories: ['Strength'],
        equipment: 'Kettlebell',
      ),
      WorkoutModel(
        id: '9',
        name: 'Weight Lifting Basics',
        photoUrl: 'https://images.unsplash.com/photo-1574680096145-d05b474e2155?w=400&h=300&fit=crop',
        description: 'Master fundamental lifting techniques',
        duration: 50,
        difficulty: 'Intermediate',
        categories: ['Strength'],
        equipment: 'Weights',
      ),
      WorkoutModel(
        id: '10',
        name: 'Chest & Shoulders',
        photoUrl: 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?w=400&h=300&fit=crop',
        description: 'Target chest and shoulder muscles',
        duration: 40,
        difficulty: 'Advanced',
        categories: ['Strength'],
        equipment: 'Weights',
        bodyFocus: 'Chest',
      ),
    ];
  }

  static List<WorkoutModel> getFeaturedWorkouts() {
    return getAllWorkouts().take(4).toList();
  }

  static List<WorkoutModel> getHomeWorkouts() {
    return getAllWorkouts().where((w) => w.equipment == 'None').toList();
  }

  static List<WorkoutModel> getWorkoutsByDifficulty(String difficulty) {
    return getAllWorkouts().where((w) => w.difficulty == difficulty).toList();
  }

  static List<WorkoutModel> getWorkoutsByBodyFocus(String bodyFocus) {
    return getAllWorkouts().where((w) => w.bodyFocus == bodyFocus).toList();
  }
}
