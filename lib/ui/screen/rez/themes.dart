import 'package:flutter/material.dart';
import 'package:places_yakimova_project/ui/screen/const/colors.dart';
import 'package:places_yakimova_project/ui/screen/const/styles.dart';
import 'package:places_yakimova_project/ui/screen/const/values.dart';

class AppTheme {
  static ThemeData get lightTheme => _buildTheme();
  static ThemeData get darkTheme => _buildThemeDark();

  AppTheme._();

  /// Светлая тема.
  static ThemeData _buildTheme() {
    final base = ThemeData.light();
    return base.copyWith(
      appBarTheme: base.appBarTheme.copyWith(
        titleTextStyle:
            AppTypography.textSightVisFavorite.withColor(AppColors.colorBlack),
        backgroundColor: AppColors.colorWhite,
        elevation: 0,
      ),
      brightness: Brightness.light,
      tabBarTheme: base.tabBarTheme.copyWith(
        indicator: BoxDecoration(
          color: AppColors.colorDarkSlateGray,
          borderRadius: BorderRadius.circular(
            AppSizes.standartHeightBig,
          ),
        ),
      ),
      backgroundColor: AppColors.colorWhite,
      textTheme: _buildTextTheme(base.textTheme),
      colorScheme: base.colorScheme.copyWith(
        background: AppColors.colorDackBlueMain,
        secondary: AppColors.colorSlateBlue,
      ),
      cardColor: AppColors.colorWhiteSmoke,
      buttonColor: AppColors.colorMediumSeaGreen,
      dividerColor: AppColors.colorSlateBlue.withOpacity(0.24),
      navigationBarTheme: base.navigationBarTheme.copyWith(
        backgroundColor: AppColors.colorDackBlueMain,
        indicatorColor: AppColors.colorSlateBlue,
      ),
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline1:
          AppTypography.textSightListCategory.withColor(AppColors.colorWhite),
      headline2:
          AppTypography.textSightListName.withColor(AppColors.colorBlack),
      headline3: AppTypography.textSightListTimeWork
          .withColor(AppColors.colorSlateBlue),
      headline4: AppTypography.textSightListTimeWork
          .withColor(AppColors.colorMediumSeaGreen),
      headline5:
          AppTypography.textPageTitle.withColor(AppColors.colorDarkSlateGray),
      headline6: AppTypography.textSightCardCaption
          .withColor(AppColors.colorDarkSlateGray),
      bodyText1: AppTypography.textSightListCategory
          .withColor(AppColors.colorDarkSlateGray),
      bodyText2: AppTypography.textSightListTimeWork
          .withColor(AppColors.colorDarkSlateGray),
      button:
          AppTypography.textSightListCategory.withColor(AppColors.colorWhite),
      subtitle1: AppTypography.textSightListTimeWork
          .withColor(AppColors.colorSlateBlue),
      subtitle2:
          AppTypography.textSightListCategory.withColor(AppColors.colorBlack),
    );
  }

  /// Темная тема.
  static ThemeData _buildThemeDark() {
    final base = ThemeData.dark();

    return base.copyWith(
      appBarTheme: base.appBarTheme.copyWith(
        titleTextStyle:
            AppTypography.textSightVisFavorite.withColor(AppColors.colorBlack),
        backgroundColor: AppColors.colorNavyBlue,
        elevation: 0,
      ),
      brightness: Brightness.dark,
      backgroundColor: AppColors.colorNavyBlue,
      tabBarTheme: base.tabBarTheme.copyWith(
        indicator: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(
            AppSizes.standartHeightBig,
          ),
        ),
      ),
      textTheme: _buildTextThemeDark(base.textTheme),
      colorScheme: base.colorScheme.copyWith(
        background: AppColors.colorWhiteSmoke,
        secondary: AppColors.colorWhite,
      ),
      cardColor: AppColors.colorAlmostBlack,
      buttonColor: AppColors.colorMediumSeaGreen,
      dividerColor: AppColors.colorSlateBlue.withOpacity(0.24),
      navigationBarTheme: base.navigationBarTheme.copyWith(
        backgroundColor: AppColors.colorWhiteSmoke,
        indicatorColor: AppColors.colorWhite,
      ),
    );
  }

  static TextTheme _buildTextThemeDark(TextTheme base) {
    return base.copyWith(
      headline1: AppTypography.textSightListCategory
          .withColor(AppColors.colorDarkSlateGray),
      headline2:
          AppTypography.textSightListName.withColor(AppColors.colorWhite),
      headline3: AppTypography.textSightListTimeWork
          .withColor(AppColors.colorSlateBlue),
      headline4: AppTypography.textSightListTimeWork
          .withColor(AppColors.colorMediumSeaGreen),
      headline5: AppTypography.textPageTitle.withColor(AppColors.colorWhite),
      headline6:
          AppTypography.textSightCardCaption.withColor(AppColors.colorWhite),
      bodyText1: AppTypography.textSightListCategory
          .withColor(AppColors.colorSlateBlue),
      bodyText2:
          AppTypography.textSightListTimeWork.withColor(AppColors.colorWhite),
      button:
          AppTypography.textSightListCategory.withColor(AppColors.colorWhite),
      subtitle1:
          AppTypography.textSightListTimeWork.withColor(AppColors.colorWhite),
    );
  }
}
