import 'dart:ui';

import 'package:places_yakimova_project/ui/screen/const/colors.dart';

import 'my_theme_data.dart';

// ignore: long-method
MyThemeData createLightTheme() => MyThemeData(
      brightness: Brightness.light,
      background: colorWhite,
      colorDecoration: colorWhiteSmoke,
      colorIndicator: colorDarkSlateGray,
      colorTextTitle: colorBlack,
      colorTextSightCategory: colorWhite,
      colorTextSightTimeWork: colorSlateBlue,
      colorSelectedItem: colorDackBlueMain,
      colorUnselectedItem: colorDackBlueSec,
      colorTabBarSelectedBack: colorDarkSlateGray,
      colorTabBarUnselectedBack: colorWhiteSmoke,
      colorTabBarSelectedText: colorDarkSlateGray,
      colorTabBarUnselectedText: colorSlateBlue,
      colorTextTimePlan: colorMediumSeaGreen,
    );
