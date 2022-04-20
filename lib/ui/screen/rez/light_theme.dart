import 'dart:ui';

import 'package:places_yakimova_project/ui/screen/const/colors.dart';

import 'package:places_yakimova_project/ui/screen/rez/my_theme_data.dart';

// ignore: long-method
MyThemeData createLightTheme() => MyThemeData(
      brightness: Brightness.light,
      background: AppColors.colorWhite,
      colorDecoration: AppColors.colorWhiteSmoke,
      colorIndicator: AppColors.colorDarkSlateGray,
      colorTextTitle: AppColors.colorBlack,
      colorTextSightCategory: AppColors.colorWhite,
      colorTextSightTimeWork: AppColors.colorSlateBlue,
      colorSelectedItem: AppColors.colorDackBlueMain,
      colorUnselectedItem: AppColors.colorDackBlueSec,
      colorTabBarSelectedBack: AppColors.colorDarkSlateGray,
      colorTabBarUnselectedBack: AppColors.colorWhiteSmoke,
      colorTabBarSelectedText: AppColors.colorDarkSlateGray,
      colorTabBarUnselectedText: AppColors.colorSlateBlue,
      colorTextTimePlan: AppColors.colorMediumSeaGreen,
    );
