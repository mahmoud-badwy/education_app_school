import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'data/repositories/user_repository_impl.dart';
import 'domain/usecases/get_user.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final firestore = FirebaseFirestore.instance;
  final userRepository = UserRepositoryImpl(firestore: firestore);
  final getUserUseCase = GetUser(userRepository);

  runApp(MyApp(getUserUseCase: getUserUseCase));
}

class MyApp extends StatelessWidget {
  final GetUser getUserUseCase;

  MyApp({required this.getUserUseCase});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(getUserUseCase: getUserUseCase),
        ),
      ],
      child: MaterialApp(
        title: 'Education App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
