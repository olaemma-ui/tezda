import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'assets_dec.dart';

/// This class is used to manage the assets of the app
/// It is a singleton class and is used to get the assets of the app
/// It is used to get the image, font, and svg assets of the app
class _AssetManager {
  // Singleton instance
  static final _AssetManager _instance = _AssetManager._internal();

  // Private constructor
  _AssetManager._internal();

  // Factory constructor to return the singleton instance
  factory _AssetManager() {
    return _instance;
  }

  // Method to get image asset
  AssetImage getImageAsset(String imageName) {
    return AssetImage('assets/images/$imageName');
  }

  // Method to get font asset path
  String getFontAsset(String fontName) {
    return 'assets/fonts/$fontName';
  }

  // Method to get SVG asset
  SvgPicture getSvgAsset(
    String svgName, {
    double? width,
    double? height,
    BoxFit? fir,
  }) {
    return SvgPicture.asset(
      'assets/svg/$svgName',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
