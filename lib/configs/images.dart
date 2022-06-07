import 'package:flutter/cupertino.dart';
import 'package:pokedex/configs/constant.dart';

class AppAssetImage extends AssetImage {
  const AppAssetImage(String name) : super('${Constant.ASSETS_IMAGES}$name');
}
