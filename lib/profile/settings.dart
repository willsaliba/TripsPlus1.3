import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //App Bar
      appBar: AppBar(
        title: const Text('Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),
        ),
      ),


      

      
    );
  }
} 
