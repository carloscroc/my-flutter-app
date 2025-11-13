class MeditativeMorning {
  final String id;
  final String name;
  final String? photoUrl;
  final int? durationMinutes;

  MeditativeMorning({required this.id, required this.name, this.photoUrl, this.durationMinutes});

  factory MeditativeMorning.fromMap(Map<String, dynamic> map) => MeditativeMorning(
        id: map['id'] as String,
        name: map['name'] as String,
        photoUrl: map['photoUrl'] as String?,
        durationMinutes: map['durationMinutes'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'photoUrl': photoUrl,
        'durationMinutes': durationMinutes,
      };
}
