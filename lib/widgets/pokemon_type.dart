import 'package:flutter/material.dart';
import 'package:pokedex/module/pokemon_types.dart';

class PokemonType extends StatelessWidget {
  const PokemonType({
    Key? key,
    required this.type,
    this.extra = '',
    this.large = false,
    this.colored = false,
  }) : super(key: key);

  final PokemonTypes type;
  final String extra;
  final bool large;
  final bool colored;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: large ? 19 : 12,
          vertical: large ? 6 : 4,
        ),
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: colored ? type.color : Colors.white.withOpacity(0.2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildText(type.typeName, textAlign: TextAlign.center),
            const SizedBox(height: 5),
            _buildText(extra),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String data, {TextAlign? textAlign}) => Text(
        data,
        textScaleFactor: 1,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: large ? 12 : 8,
          height: 0.8,
          fontWeight: large ? FontWeight.bold : FontWeight.normal,
          color: colored ? type.color : Colors.white,
        ),
      );
}
