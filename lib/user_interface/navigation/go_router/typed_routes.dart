import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_training/user_interface/navigation/go_router/main.dart';
import 'package:flutter_training/user_interface/navigation/go_router/screens/default_screen.dart';
import 'package:flutter_training/user_interface/navigation/go_router/screens/screen1.dart';
import 'package:flutter_training/user_interface/navigation/go_router/screens/screen2.dart';
import 'package:flutter_training/user_interface/navigation/go_router/screens/screen3.dart';

part 'typed_routes.g.dart';


/// Step0: Add the go_router_builder, build_runner, build_verify to dev
/// Step1: Define the Annotation like
///       @TypedGoRoute<Name>(path: '/')
/// Step2: Extend the Route with GoRouteData and mixin (So that we can use the built methods)
/// Step3: Navigation
///       Simple:
///       Screen1Route().go(context)
///       With Data:
///       Screen3Route(name: "Go router", description: 'Data received').push<Screen3Data>(context)
@TypedGoRoute<MainScreenRoute>(path: '/')
class MainScreenRoute extends GoRouteData with _$MainScreenRoute {
  const MainScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MainScreen();
  }
}

@TypedGoRoute<Screen1Route>(path: '/first',)
class Screen1Route extends GoRouteData with _$Screen1Route {
  const Screen1Route();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Screen1();
  }
}

@TypedGoRoute<Screen2Route>(path: '/second',)
class Screen2Route extends GoRouteData with _$Screen2Route {
  const Screen2Route();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Screen2();
  }
}

@TypedGoRoute<Screen3Route>(path: '/third',)
class Screen3Route extends GoRouteData with _$Screen3Route {
  // Using basic types (String) that are supported by go_router_builder
  final String? name;
  final String? description;

  const Screen3Route({this.name, this.description});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if (name != null && description != null) {
      final data = Screen3Data(name: name!, description: description!);
      return Screen3(data: data);
    }
    return const DefaultScreen();
  }
}

// Router configuration using the generated routes
final typedRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: '/',
);
