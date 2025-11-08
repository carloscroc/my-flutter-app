class WorkoutStruct {
  final String? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final int? duration;
  final String? difficulty;
  final List<String>? tags;

  WorkoutStruct({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.duration,
    this.difficulty,
    this.tags,
  });

  factory WorkoutStruct.fromMap(Map<String, dynamic> map) {
    return WorkoutStruct(
      id: map['id'] as String?,
      title: map['title'] as String?,
      description: map['description'] as String?,
      imageUrl: map['imageUrl'] as String?,
      duration: map['duration'] as int?,
      difficulty: map['difficulty'] as String?,
      tags: map['tags'] != null ? List<String>.from(map['tags'] as List) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'duration': duration,
      'difficulty': difficulty,
      'tags': tags,
    };
  }
}
