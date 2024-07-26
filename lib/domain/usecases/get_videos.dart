import '../repositories/user_repository.dart';
import '../entities/video.dart';

class GetVideosBySubject {
  final UserRepository repository;

  GetVideosBySubject(this.repository);

  Future<List<Video>> call(String subjectId) async {
    return await repository.getVideosBySubject(subjectId);
  }
}
