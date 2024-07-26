import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: authProvider.user == null
            ? Text('No user data')
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${authProvider.user!.name}'),
                  Text('Email: ${authProvider.user!.email}'),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => authProvider.fetchUser('userId'),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
