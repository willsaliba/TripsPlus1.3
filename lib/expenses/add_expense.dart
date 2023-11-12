import 'package:flutter/material.dart';

class AddTripScreen extends StatelessWidget {
  const AddTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //App Bar
      appBar: AppBar(
        title: const Text('Add Trip',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),
        ),
      ),
      
    );
  }
} 
