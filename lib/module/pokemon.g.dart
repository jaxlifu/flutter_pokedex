// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      zukanId: json['zukan_id'] as String,
      zukanSubId: json['zukan_sub_id'] as int,
      pokemonName: json['pokemon_name'] as String,
      pokemonSubName: json['pokemon_sub_name'] as String,
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      fileName: json['file_name'] as String,
      pokemonTypeId: json['pokemon_type_id'] as String,
      pokemonTypeName: json['pokemon_type_name'] as String,
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'zukan_id': instance.zukanId,
      'zukan_sub_id': instance.zukanSubId,
      'pokemon_name': instance.pokemonName,
      'pokemon_sub_name': instance.pokemonSubName,
      'weight': instance.weight,
      'height': instance.height,
      'file_name': instance.fileName,
      'pokemon_type_id': instance.pokemonTypeId,
      'pokemon_type_name': instance.pokemonTypeName,
    };
