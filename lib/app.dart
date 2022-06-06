import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokedex/routes.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.app_name,
      onGenerateRoute: RouteConfiguation.onGenerateRoute,
      navigatorKey: RouteConfiguation.globalKey,
      scrollBehavior: const ScrollBehavior().copyWith(
        scrollbars: false,
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
    );
  }
}
