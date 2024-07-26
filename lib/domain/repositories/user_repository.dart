import '../entities/user.dart';
import '../entities/video.dart';

abstract class UserRepository {
  Future<User> getUser(String id);
  Future<List<Video>> getVideosBySubject(String subjectId);
}
