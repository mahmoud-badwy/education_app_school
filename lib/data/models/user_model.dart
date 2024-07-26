import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({required String id, required String name, required String email})
      : super(id: id, name: name, email: email);

  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      name: data['name'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
