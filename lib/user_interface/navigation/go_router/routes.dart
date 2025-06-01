import 'package:flutter_training/user_interface/navigation/go_router/main.dart';
import 'package:flutter_training/user_interface/navigation/go_router/screens/default_screen.dart';
import 'package:flutter_training/user_interface/navigation/go_router/screens/screen1.dart';
import 'package:flutter_training/user_interface/navigation/go_router/screens/screen2.dart';
import 'package:flutter_training/user_interface/navigation/go_router/screens/screen3.dart';
import 'package:go_router/go_router.dart';

class Route {
  final String path;
  final String name;

  Route({required this.path, required this.name});
}

class RouteConfigs {
  static Route mainScreen = Route(path: '/', name: 'MainScreen');
  static Route screen1 = Route(path: '/first', name: 'FirstScreen');
  static Route screen2 = Route(path: '/second', name: 'SecondScreen');
  static Route screen3 = Route(path: '/third', name: 'ThirdScreen');

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: mainScreen.name,
        path: mainScreen.path,
        builder: (context, state) => const MainScreen(),
      ),

      GoRoute(
        name: screen1.name,
        path: screen1.path,
        builder: (context, state) => const Screen1(),
      ),

      GoRoute(
        name: screen2.name,
        path: screen2.path,
        builder: (context, state) => const Screen2(),
      ),

      GoRoute(
        name: screen3.name,
        path: screen3.path,
        builder: (context, state) {
          final extra = state.extra;
          if(extra == null) DefaultScreen();
          final data = state.extra as Screen3Data?;
          return data != null ? Screen3(data: data) : DefaultScreen();
        },
      ),
    ],
    redirect: (context, state) {
      return null;
      // return state.fullPath == screen3.path ? screen2.path : null;
    }
  );
}
