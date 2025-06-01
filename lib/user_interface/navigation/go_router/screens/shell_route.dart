import 'package:flutter/material.dart';

class ShellRoute extends StatelessWidget {
  const ShellRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shell Route"),

      ),
      body: Center(
        child: Text("Screen 2"),
      ),
    );
  }
}
