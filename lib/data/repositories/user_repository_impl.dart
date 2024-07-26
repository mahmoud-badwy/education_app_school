import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/video.dart';
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
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Video>> getVideosBySubject(String subjectId) async {
    try {
      final querySnapshot = await firestore
          .collection('videos')
          .where('subjectId', isEqualTo: subjectId)
          .get();

      return querySnapshot.docs.map((doc) => VideoModel.fromFirestore(doc.data())).toList();
    } catch (e) {
      throw Exception('Failed to load videos: $e');
    }
  }
}
