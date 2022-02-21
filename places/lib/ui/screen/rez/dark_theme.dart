import 'dart:ui';

import 'package:places_yakimova_project/ui/screen/const/colors.dart';

import 'my_theme_data.dart';

// ignore: long-method
MyThemeData createDarkTheme() => MyThemeData(
      brightness: Brightness.dark,
      background: colorBlack,
      colorDecoration: colorRed,
      colorIndicator: colorDarkSlateGray,
    );
