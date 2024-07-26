import '../repositories/user_repository.dart';
import '../entities/user.dart';
import '../../core/usecases/usecase.dart';

class GetUser implements UseCase<User, String> {
  final UserRepository repository;

  GetUser(this.repository);

  @override
  Future<User> call(String params) async {
    return await repository.getUser(params);
  }
}
