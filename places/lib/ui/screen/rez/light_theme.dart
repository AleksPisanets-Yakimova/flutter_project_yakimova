import 'dart:ui';

import 'package:places_yakimova_project/ui/screen/const/colors.dart';

import 'my_theme_data.dart';

// ignore: long-method
MyThemeData createLightTheme() => MyThemeData(
      brightness: Brightness.light,
      background: colorWhite,
      colorDecoration: colorMediumSeaGreen,
      colorIndicator: colorDarkSlateGray,
    );
