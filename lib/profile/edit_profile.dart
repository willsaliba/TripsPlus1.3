import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //App Bar
      appBar: AppBar(
        title: const Text('Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),
        ),
      ),
      
    );
  }
} 
