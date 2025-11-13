class UserModel {
  final String id;
  final String email;
  final String? displayName;
  final String? photoUrl;

  UserModel({required this.id, required this.email, this.displayName, this.photoUrl});

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map['id'] as String,
        email: map['email'] as String,
        displayName: map['displayName'] as String?,
        photoUrl: map['photoUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'email': email,
        'displayName': displayName,
        'photoUrl': photoUrl,
      };
}
