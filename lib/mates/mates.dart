import 'package:flutter/material.dart';

class MatesScreen extends StatelessWidget {
  const MatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Mates',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),

    );
  }
}
