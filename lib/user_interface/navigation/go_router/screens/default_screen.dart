import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Default Screen'),
      ),
      body: Center(
        child: Text('Default Screen'),
      ),
    );
  }
}
