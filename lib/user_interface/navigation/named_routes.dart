import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: Routes.screen1,
      routes: {
        Routes.screen1: (context) => Screen1(),
        Routes.screen2: (context) => Screen2(),
      },
    ),
  );
}

class Routes {
  static const String screen1 = '/';
  static const String screen2 = '/second';
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 1")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.screen2);
          },
          child: Text("Navigate to Screen 2"),
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
      appBar: AppBar(title: Text("Screen 2")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Back to Screen 1"),
        ),
      ),
    );
  }
}
