import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/configs/constant.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(_autoNavigator);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTitle(context),
            Lottie.asset(
              '${Constant.ASSETS_LOTTIES}pikachu_loading.json',
              width: 256,
              height: 256,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    return Text(
      appLocalizations.app_name,
      style: textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Future<void> _autoNavigator() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    logger.d('splash navigator to homePage');
    await RouteConfiguation.replaceWith(Routes.home);
  }
}
