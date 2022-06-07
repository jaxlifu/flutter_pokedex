import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';

class PokemonBallBackground extends StatelessWidget {
  const PokemonBallBackground({
    Key? key,
    required this.child,
    this.floatingActionButton,
  }) : super(key: key);

  static const double _pokeballFraction = 0.664;

  final Widget child;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final pokeballSize = MediaQuery.of(context).size.width * _pokeballFraction;
    final appBarHeight = AppBar().preferredSize.height;
    final iconSize = IconTheme.of(context).size ?? 0;
    final pokeballTopMargin =
        -(pokeballSize / 2 - safeAreaTop - appBarHeight / 2);
    final pokeballRightMargin = -(pokeballSize / 2 - iconSize / 2);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: pokeballTopMargin,
            right: pokeballRightMargin,
            child: Image(
              image: const AppAssetImage('pokeball.png'),
              width: pokeballSize,
              height: pokeballSize,
              color: AppColors.black.withOpacity(0.05),
            ),
          ),
          child,
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
