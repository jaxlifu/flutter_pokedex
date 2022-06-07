import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/configs/constant.dart';

class PokeBallLoadingWidget extends StatelessWidget {
  const PokeBallLoadingWidget({
    Key? key,
    this.name = '${Constant.ASSETS_LOTTIES}pokeball_loading.json',
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.6;
    return Center(
      child: Lottie.asset(
        name,
        fit: BoxFit.cover,
        width: size,
        height: size,
      ),
    );
  }
}
