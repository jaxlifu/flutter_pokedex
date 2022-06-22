import 'package:flutter/material.dart';
import 'package:pokedex/pages/home.dart';
import 'package:pokedex/pages/pokemon_info.dart';
import 'package:pokedex/pages/splash.dart';

enum Routes {
  splash(path: '/'),
  home(path: '/home/'),
  detail(path: '/home/detail/'),
  unknown(path: '');

  const Routes({required this.path});
  final String path;

  factory Routes.byPath(String path) {
    try {
      return Routes.values.singleWhere((element) => element.path == path);
    } on Exception {
      return Routes.unknown;
    }
  }
}

class RouteConfiguation {
  static final GlobalKey<NavigatorState> globalKey = GlobalKey();

  static NavigatorState? get state => globalKey.currentState;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name?.isEmpty == true) {
      return null;
    }
    final routes = Routes.byPath(settings.name!);
    switch (routes) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.detail:
        return MaterialPageRoute(builder: ((context) => const PokemonInfo()));
      case Routes.unknown:
        return null;
    }
  }

  static pop() => state?.pop();

  static push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(route.path, arguments: arguments);

  static replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(route.path, arguments: arguments);
}
