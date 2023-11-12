import 'package:flutter/material.dart';

class ATripScreen extends StatelessWidget {
  const ATripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //App Bar
      appBar: AppBar(
        title: const Text('[TripName] Expenses',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),
        ),
      ),
      
    );
  }
} 
//ability to add an expense