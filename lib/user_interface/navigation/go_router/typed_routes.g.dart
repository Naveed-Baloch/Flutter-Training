// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typed_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $mainScreenRoute,
  $screen1Route,
  $screen2Route,
  $screen3Route,
];

RouteBase get $mainScreenRoute =>
    GoRouteData.$route(path: '/', factory: _$MainScreenRoute._fromState);

mixin _$MainScreenRoute on GoRouteData {
  static MainScreenRoute _fromState(GoRouterState state) =>
      const MainScreenRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $screen1Route =>
    GoRouteData.$route(path: '/first', factory: _$Screen1Route._fromState);

mixin _$Screen1Route on GoRouteData {
  static Screen1Route _fromState(GoRouterState state) => const Screen1Route();

  @override
  String get location => GoRouteData.$location('/first');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $screen2Route =>
    GoRouteData.$route(path: '/second', factory: _$Screen2Route._fromState);

mixin _$Screen2Route on GoRouteData {
  static Screen2Route _fromState(GoRouterState state) => const Screen2Route();

  @override
  String get location => GoRouteData.$location('/second');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $screen3Route =>
    GoRouteData.$route(path: '/third', factory: _$Screen3Route._fromState);

mixin _$Screen3Route on GoRouteData {
  static Screen3Route _fromState(GoRouterState state) => Screen3Route(
    name: state.uri.queryParameters['name'],
    description: state.uri.queryParameters['description'],
  );

  Screen3Route get _self => this as Screen3Route;

  @override
  String get location => GoRouteData.$location(
    '/third',
    queryParams: {
      if (_self.name != null) 'name': _self.name,
      if (_self.description != null) 'description': _self.description,
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
