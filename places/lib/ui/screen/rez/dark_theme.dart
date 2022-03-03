import 'dart:ui';

import 'package:places_yakimova_project/ui/screen/const/colors.dart';

import 'my_theme_data.dart';

// ignore: long-method
MyThemeData createDarkTheme() => MyThemeData(
      brightness: Brightness.dark,
      background: colorBlack,
      colorDecoration: colorAlmostBlack,
      colorIndicator: colorDarkSlateGray,
      colorTextTitle: colorWhite,
      colorTextSightCategory: colorWhite,
      colorTextSightTimeWork: colorSlateBlue,
      colorSelectedItem: colorWhite,
      colorUnselectedItem: colorWhiteSmoke,
      colorTabBarSelectedBack: colorWhite,
      colorTabBarUnselectedBack: colorAlmostBlack,
      colorTabBarSelectedText: colorDarkSlateGray,
      colorTabBarUnselectedText: colorSlateBlue,
      colorTextTimePlan: colorMediumSeaGreen,
    );
