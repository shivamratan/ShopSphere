
class User {
  final String id;
  final String email;
  final String name;
  final String? profilePic;
  final DateTime createdAt;

  User({
    required this.id,
    required this.email,
    required this.name,
    this.profilePic,
    required this.createdAt,
  });

  // Convert model to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': id,
      'email': email,
      'name': name,
      'profilePic': profilePic,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['uid'] as String,
      email: map['email'],
      name: map['name'],
      profilePic: map['profilePic'],
      createdAt: DateTime.parse(map['createdAt'])
    );
  }
}