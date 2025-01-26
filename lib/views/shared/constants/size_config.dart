import 'package:flutter/material.dart';

class SizeConfig {
  SizeConfig._();

  static late MediaQueryData _mediaQueryData;

  static double screenWidth = 0;
  static double textScaleFactor = 0;
  static double screenHeight = 0;
  static double statusBarHeight = 0;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    statusBarHeight = _mediaQueryData.viewPadding.top;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}
