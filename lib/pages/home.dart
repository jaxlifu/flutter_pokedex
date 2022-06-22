import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokedex/http/api.dart';
import 'package:pokedex/module/pokemon.dart';
import 'package:pokedex/pages/pokemon_info.dart';
import 'package:pokedex/routes.dart';
import 'package:pokedex/widgets/error_widget.dart';
import 'package:pokedex/widgets/loading_widget.dart';
import 'package:pokedex/widgets/pokeball_background.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Pokemon>> _pokemonList;
  final _api = API();

  @override
  void initState() {
    super.initState();
    _pokemonList = _api.getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return PokemonBallBackground(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text(AppLocalizations.of(context)!.app_name),
            backgroundColor: Colors.transparent,
            floating: false,
            elevation: 0,
          )
        ],
        body: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) => FutureBuilder<List<Pokemon>>(
        future: _pokemonList,
        builder: (context, snapshot) {
          log('FutureBuilder builder');
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final pokemons = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(28.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: pokemons.length,
              itemBuilder: (BuildContext context, int index) {
                final pokemon = pokemons[index];
                return PokemonCard(
                  pokemon: pokemon,
                  onPress: () {
                    RouteConfiguation.push(Routes.detail);
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            final appLocalizations = AppLocalizations.of(context)!;
            return PokeErrorWidget(
              message: appLocalizations.load_failed,
              onTap: () {
                setState(() {
                  _pokemonList = _api.getPokemonList();
                });
              },
            );
          }

          return const PokeBallLoadingWidget();
        },
      );
}
