import 'package:flutter/material.dart';

class FindMatesScreen extends StatelessWidget {
  const FindMatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Find Mates',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),

    );
  }
}
