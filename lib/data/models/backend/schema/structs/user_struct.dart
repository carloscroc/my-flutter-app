class UserStruct {
  final String? uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final DateTime? createdTime;

  UserStruct({
    this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
    this.createdTime,
  });

  factory UserStruct.fromMap(Map<String, dynamic> map) {
    return UserStruct(
      uid: map['uid'] as String?,
      email: map['email'] as String?,
      displayName: map['displayName'] as String?,
      photoUrl: map['photoUrl'] as String?,
      createdTime: map['createdTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdTime'] as int)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'createdTime': createdTime?.millisecondsSinceEpoch,
    };
  }
}
