import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/entities/user.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore firestore;

  UserRepositoryImpl({required this.firestore});

  @override
  Future<User> getUser(String id) async {
    try {
      final doc = await firestore.collection('users').doc(id).get();
      if (doc.exists) {
        return UserModel.fromFirestore(doc.data()!);
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
