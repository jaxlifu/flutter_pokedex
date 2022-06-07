// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:pokedex/configs/colors.dart';

enum PokemonTypes {
  GRASS(color: AppColors.lightGreen, typeName: '草'),
  POISON(color: AppColors.lightPurple, typeName: '毒'),
  FIRE(color: AppColors.lightRed, typeName: '火'),
  FLYING(color: AppColors.lilac, typeName: '飞行'),
  DRAGON(color: AppColors.violet, typeName: '龙'),
  WATER(color: AppColors.lightBlue, typeName: '水'),
  BUG(color: AppColors.lightTeal, typeName: '虫'),
  NORMAL(color: AppColors.beige, typeName: '一般'),
  DARK(color: AppColors.black, typeName: '恶'),
  ELECTRIC(color: AppColors.lightYellow, typeName: '电'),
  PSYCHIC(color: AppColors.lightPink, typeName: '超能力'),
  ICE(color: AppColors.lightCyan, typeName: '冰'),
  STEEL(color: AppColors.grey, typeName: '钢'),
  GROUND(color: AppColors.darkBrown, typeName: '地面'),
  FAIRY(color: AppColors.pink, typeName: '妖精'),
  FIGHTING(color: AppColors.red, typeName: '格斗'),
  ROCK(color: AppColors.lightBrown, typeName: '岩石'),
  GHOST(color: AppColors.purple, typeName: '幽灵');

  final Color color;
  final String typeName;

  const PokemonTypes({required this.color, required this.typeName});

  factory PokemonTypes.formName(String name) => PokemonTypes.values
      .firstWhere((type) => type.name.toUpperCase() == name.toUpperCase());
}
