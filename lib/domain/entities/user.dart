class User {
  final String id;
  final String name;
  final String email;
  final String role; // student, teacher, admin
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
  });
}
