import 'package:flutter/material.dart';
import 'package:trips_plus/login/login.dart';
import 'package:trips_plus/trips/trips.dart';
import 'package:trips_plus/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading');
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        } else if (snapshot.hasData) {
          return const TripsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
} 