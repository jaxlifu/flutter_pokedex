import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/module/pokemon.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({
    Key? key,
    required this.pokemon,
    required this.size,
    this.padding = EdgeInsets.zero,
    this.useHero = true,
    this.placeholder = const AppAssetImage('bulbasaur.png'),
    this.tintColor,
  }) : super(key: key);

  final Pokemon pokemon;
  final EdgeInsets padding;
  final bool useHero;
  final ImageProvider placeholder;
  final Size size;
  final Color? tintColor;

  @override
  Widget build(BuildContext context) {
    return HeroMode(
      enabled: useHero,
      child: Hero(
        tag: pokemon.thumbnailImage,
        child: AnimatedPadding(
          padding: padding,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOutQuint,
          child: CachedNetworkImage(
            imageUrl: pokemon.thumbnailImage,
            useOldImageOnUrlChange: true,
            imageBuilder: (context, imageProvider) => Image(
              image: imageProvider,
              width: size.width,
              height: size.height,
              alignment: Alignment.bottomCenter,
              color: tintColor,
              fit: BoxFit.contain,
            ),
            placeholder: (context, url) => Image(
              image: placeholder,
              width: size.width,
              height: size.height,
              alignment: Alignment.bottomCenter,
              color: Colors.black12,
              fit: BoxFit.contain,
            ),
            errorWidget: (context, url, error) => Stack(
              alignment: Alignment.center,
              children: [
                Image(
                  image: placeholder,
                  width: size.width,
                  height: size.height,
                  color: Colors.black12,
                ),
                Icon(
                  Icons.warning_amber_rounded,
                  size: size.width * 0.3,
                  color: Colors.black26,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
