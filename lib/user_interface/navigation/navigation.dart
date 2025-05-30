import 'package:flutter/material.dart';

/// 1. Navigator -> Sample without deep links
/// 2. Router -> Complex Navigation and with deep links
void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Container(
          color: Colors.white,
          child: Material(child: MainScreen()),
        ),
      ),
    ),
  );
}

/// 1. Use Navigator ------------------------------------------------------

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screen2()),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screen2()),
            );
          },
          child: const Text('Go to Screen 2'),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 2')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back to Main Screen'),
        ),
      ),
    );
  }
}

/// 2. Use Router ------------------------------------------------------
