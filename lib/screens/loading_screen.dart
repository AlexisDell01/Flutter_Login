import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Loading..'),

      ),
      body: const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF5C2D6C),
        ),
      ),
    );
  }
}