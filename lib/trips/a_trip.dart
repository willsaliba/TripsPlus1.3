import 'package:flutter/material.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //App Bar
      appBar: AppBar(
        title: const Text('A Trips Name',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),
        ),
      ),
      
    );
  }
} 
//ability to add an expense