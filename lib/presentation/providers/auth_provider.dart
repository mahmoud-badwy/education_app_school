import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user.dart';

class AuthProvider with ChangeNotifier {
  final GetUser getUserUseCase;
  User? _user;

  AuthProvider({required this.getUserUseCase});

  User? get user => _user;

  Future<void> fetchUser(String id) async {
    final user = await getUserUseCase(id);
    _user = user;
    notifyListeners();
  }
}
