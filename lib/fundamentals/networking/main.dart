import 'package:flutter/material.dart';
import 'package:flutter_training/fundamentals/networking/ui/posts_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Container(
          color: Colors.white,
          child: Material(child: PostsScreen()),
        ),
      ),
    ),
  );
}
