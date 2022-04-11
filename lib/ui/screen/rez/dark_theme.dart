import 'dart:ui';

import 'package:places_yakimova_project/ui/screen/const/colors.dart';

import 'my_theme_data.dart';

// ignore: long-method
MyThemeData createDarkTheme() => MyThemeData(
      brightness: Brightness.dark,
      background: AppColors.colorBlack,
      colorDecoration: AppColors.colorAlmostBlack,
      colorIndicator: AppColors.colorDarkSlateGray,
      colorTextTitle: AppColors.colorWhite,
      colorTextSightCategory: AppColors.colorWhite,
      colorTextSightTimeWork: AppColors.colorSlateBlue,
      colorSelectedItem: AppColors.colorWhite,
      colorUnselectedItem: AppColors.colorWhiteSmoke,
      colorTabBarSelectedBack: AppColors.colorWhite,
      colorTabBarUnselectedBack: AppColors.colorAlmostBlack,
      colorTabBarSelectedText: AppColors.colorDarkSlateGray,
      colorTabBarUnselectedText: AppColors.colorSlateBlue,
      colorTextTimePlan: AppColors.colorMediumSeaGreen,
    );
