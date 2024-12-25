import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "onTrack",
          style: TextStyle(color: Color.fromARGB(255, 22, 134, 7)),
        ),
      ),
    );
  }
}
