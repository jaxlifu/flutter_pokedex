// ignore_for_file: constant_identifier_names

import 'package:pokedex/http/http_request.dart';
import 'package:pokedex/module/pokemon.dart';

class API {
  static const BASE_URL = 'https://www.pokemon.cn';
  static const POKEDEX_URL = '$BASE_URL/play/pokedex/api/v1';
  static const RESOURCES_URL = '$BASE_URL/play/resources/pokedex';

  final HttpRequest _request = HttpRequest();

  Future<List<Pokemon>> getPokemonList() async {
    final result = await _request.get(POKEDEX_URL);
    return (result['pokemons'] as List)
        .map((json) => Pokemon.fromJson(json))
        .toList();
  }
}
