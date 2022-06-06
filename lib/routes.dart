import 'package:flutter/material.dart';
import 'package:pokedex/pages/home.dart';
import 'package:pokedex/pages/splash.dart';

enum Routes {
  splash(name: '/'),
  home(name: '/home/');

  const Routes({required this.name});
  final String name;
}

class RouteConfiguation {
  static final GlobalKey<NavigatorState> globalKey = GlobalKey();

  static NavigatorState? get state => globalKey.currentState;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (Routes.splash.name == settings.name) {
      return MaterialPageRoute(builder: (context) => const SplashPage());
    } else if (Routes.home.name == settings.name) {
      return MaterialPageRoute(builder: (context) => const HomePage());
    }
    return null;
  }

  static pop() => state?.pop();

  static push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(route.name, arguments: arguments);

  static replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(route.name, arguments: arguments);
}
