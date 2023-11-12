import 'package:flutter/material.dart';

class MyMateScreen extends StatelessWidget {
  const MyMateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('My Mate',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),

    );
  }
}
