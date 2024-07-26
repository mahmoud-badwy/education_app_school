import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'student/home_student_screen.dart';
import 'teacher/home_teacher_screen.dart';
import 'admin/home_admin_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.user == null) {
      return CircularProgressIndicator();
    }

    switch (authProvider.user!.role) {
      case 'student':
        return HomeStudentScreen();
      case 'teacher':
        return HomeTeacherScreen();
      case 'admin':
        return HomeAdminScreen();
      default:
        return Text('Unknown role');
    }
  }
}
