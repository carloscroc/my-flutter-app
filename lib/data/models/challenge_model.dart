class ChallengeModel {
  final String id;
  final String name;
  final String photoUrl;
  final String? description;
  final int? durationDays; // Challenge duration in days
  final String? difficulty;
  final String? goal; // e.g., "30 Days of Yoga", "100 Push-ups"

  ChallengeModel({
    required this.id,
    required this.name,
    required this.photoUrl,
    this.description,
    this.durationDays,
    this.difficulty,
    this.goal,
  });

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String,
      description: json['description'] as String?,
      durationDays: json['durationDays'] as int?,
      difficulty: json['difficulty'] as String?,
      goal: json['goal'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'photoUrl': photoUrl,
      'description': description,
      'durationDays': durationDays,
      'difficulty': difficulty,
      'goal': goal,
    };
  }
}

// Mock data for testing
class MockChallengeData {
  static List<ChallengeModel> getAllChallenges() {
    return [
      ChallengeModel(
        id: '1',
        name: '30 Day Yoga Challenge',
        photoUrl: 'https://images.unsplash.com/photo-1506126613408-eca07ce68773?w=400&h=300&fit=crop',
        description: 'Transform your practice in 30 days',
        durationDays: 30,
        difficulty: 'Beginner',
        goal: 'Daily yoga practice',
      ),
      ChallengeModel(
        id: '2',
        name: '100 Push-ups Challenge',
        photoUrl: 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400&h=300&fit=crop',
        description: 'Build upper body strength progressively',
        durationDays: 30,
        difficulty: 'Intermediate',
        goal: '100 consecutive push-ups',
      ),
      ChallengeModel(
        id: '3',
        name: 'Plank Challenge',
        photoUrl: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop',
        description: 'Strengthen your core day by day',
        durationDays: 21,
        difficulty: 'Beginner',
        goal: '5 minute plank hold',
      ),
      ChallengeModel(
        id: '4',
        name: 'Run to 5K',
        photoUrl: 'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?w=400&h=300&fit=crop',
        description: 'Go from couch to running 5K',
        durationDays: 60,
        difficulty: 'Beginner',
        goal: 'Run 5 kilometers',
      ),
      ChallengeModel(
        id: '5',
        name: 'Flexibility Challenge',
        photoUrl: 'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=400&h=300&fit=crop',
        description: 'Improve flexibility and mobility',
        durationDays: 30,
        difficulty: 'All Levels',
        goal: 'Touch your toes comfortably',
      ),
    ];
  }
}
