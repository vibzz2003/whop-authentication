import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kodersassignment2/providers/auth_provider.dart';
import 'package:kodersassignment2/profile_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userProfile = authProvider.userProfile;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: userProfile != null
            ? ProfileView(user: userProfile)
            : const CircularProgressIndicator(),
      ),
    );
  }
}
