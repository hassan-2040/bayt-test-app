import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;

  //screen info/config
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;
  static late bool smallDevice;

  static late double userScreensAppBarHeight;

  //text size config
  static late double textSizeMainHeading;
  static late double textSizeSubHeading;
  static late double textSizeLarge;
  static late double textSizeNormal;
  static late double textSizeSmall;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    if (screenWidth > 350 && screenHeight > 600) {
      smallDevice = false;
    } else {
      smallDevice = true;
    }

    //setting text size based on screen size
    if (smallDevice) {
      textSizeMainHeading = 23;
      textSizeSubHeading = 18;
      textSizeLarge = 15;
      textSizeNormal = 13;
      textSizeSmall = 10;

      userScreensAppBarHeight = 80;
    } else {
      textSizeMainHeading = 30;
      textSizeSubHeading = 21;
      textSizeLarge = 18;
      textSizeNormal = 16;
      textSizeSmall = 12;

      userScreensAppBarHeight = 100;
    }

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}
