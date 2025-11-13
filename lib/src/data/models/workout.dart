class Workout {
  final String id;
  final String name;
  final String? photoUrl;
  final bool isFeatured;
  final String? shortDescription;

  Workout({required this.id, required this.name, this.photoUrl, this.isFeatured = false, this.shortDescription});

  factory Workout.fromMap(Map<String, dynamic> map) => Workout(
        id: map['id'] as String,
        name: map['name'] as String,
        photoUrl: map['photoUrl'] as String?,
        isFeatured: map['isFeatured'] as bool? ?? false,
        shortDescription: map['shortDescription'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'photoUrl': photoUrl,
        'isFeatured': isFeatured,
        'shortDescription': shortDescription,
      };
}
