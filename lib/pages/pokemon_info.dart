import 'package:flutter/material.dart';
import 'package:pokedex/l10n/l10n.dart';

class PokemonInfo extends StatefulWidget {
  const PokemonInfo({Key? key}) : super(key: key);

  @override
  State<PokemonInfo> createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [],
      ),
    );
  }
}

class BackgroundDecoration extends StatefulWidget {
  const BackgroundDecoration({
    Key? key,
  }) : super(key: key);

  @override
  State<BackgroundDecoration> createState() => _BackgroundDecorationState();
}

class _BackgroundDecorationState extends State<BackgroundDecoration> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Stack(
      children: const [],
    );
  }

  Widget _buildBackground() => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        constraints: const BoxConstraints.expand(),
      );
}
