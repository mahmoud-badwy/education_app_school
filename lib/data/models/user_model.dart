import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String id,
    required String name,
    required String email,
    required String role,
    required DateTime createdAt,
  }) : super(
    id: id,
    name: name,
    email: email,
    role: role,
    createdAt: createdAt,
  );

  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      role: data['role'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'createdAt': createdAt,
    };
  }
}
