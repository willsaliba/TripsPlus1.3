import 'package:flutter/material.dart';
import 'package:trips_plus/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //App Bar
      appBar: AppBar(
        title: const Text('Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),
        ),
      ),

      body: Center(
        child: ElevatedButton(
          child: const Text('signout'),
          onPressed: () {
            AuthService().signOut();
            Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
          }
        ),
      ),


      //add a hamburger menu for settings, edit profile, share profile

      
    );
  }
} 
