import 'package:flutter/material.dart';
import 'package:flutter_training/fundamentals/networking/theme/theme_manager.dart';
import 'package:flutter_training/fundamentals/networking/ui/posts_screen.dart';
import 'package:flutter_training/user_interface/design_and_theme/design_and_theme.dart';

import '../local_caching.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferenceExample();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeManager _themeManager = ThemeManager();

  @override
  void dispose() {
    _themeManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _themeManager,
      builder: (context, _) {
        return MaterialApp(
          themeMode: _themeManager.themeMode,
          theme: getAppTheme(Brightness.light),
          darkTheme: getAppTheme(Brightness.dark),
          home: PostsScreen(themeManager: _themeManager),
        );
      },
    );
  }
}
