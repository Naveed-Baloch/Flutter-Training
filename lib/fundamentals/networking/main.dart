import 'package:flutter/material.dart';
import 'package:flutter_training/fundamentals/networking/ui/posts_screen.dart';

import '../local_caching.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferenceExample();
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
