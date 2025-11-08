class MeditationStruct {
  final String? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final int? duration;
  final String? category;
  final String? audioUrl;

  MeditationStruct({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.duration,
    this.category,
    this.audioUrl,
  });

  factory MeditationStruct.fromMap(Map<String, dynamic> map) {
    return MeditationStruct(
      id: map['id'] as String?,
      title: map['title'] as String?,
      description: map['description'] as String?,
      imageUrl: map['imageUrl'] as String?,
      duration: map['duration'] as int?,
      category: map['category'] as String?,
      audioUrl: map['audioUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'duration': duration,
      'category': category,
      'audioUrl': audioUrl,
    };
  }
}
