import 'package:flutter/cupertino.dart';
import 'package:places_yakimova_project/domain/sight.dart';

class AppSizes {
  static const double standartSpacingZero = 0;
  static const double standartSpacing = 16;
  static const double standartSpacingBig = standartSpacing + 1;
  static const double standartSpacingForGalery = 0.5;

  static const double standartRadius = 10;
  static const double standartRadiusBig = 12;

  static const double standartTextSize = 14;

  static const double standartSizeBox = 23;
  static const double standartSizedBox = 2;
  static const double standartSpacingTextGalery = 24;

  static const double standartSizeIndent = 32;

  static const double standartHeight = 0.8;
  static const double standartHeightSmall = 8;
  static const double standartHeightBig = 40;
  static const double standartHeightBigger = 48;

  static const double standartTop = 64;

  static const double standartWidth = 9;
  static const double standartWidthBig = 10;
  static const double standartWidthBigger = 83;
  static const double standartWidthLargest = 200;

  static const double standartHightImage = 360;
}
// Текстовые переменные:

class AppTexts {
  static const String textBuildRroute = 'ПОСТРОИТЬ МАРШРУТ';
  static const String textFavorites = 'Избранное';
  static const String textTitle = 'Cписок интересных мест';
  static const String textTimeWork = 'закрыто до 09:00';
  static const String textTimePlan = 'Запланировано на 12 окт. 2021';
  static const String textToFavorites = 'В избранное';
  static const String textToSchedule = 'Запланировать';
  static const String textVisited = 'Посетил';
  static const String textWantToVisit = 'Хочу посетить';
}

const mapSightTypeToString = {
  SightType.other: 'другое',
  SightType.cafe: 'кафе',
  SightType.hotel: 'отель',
  SightType.museum: 'музей',
  SightType.park: 'парк',
  SightType.restaurant: 'ресторан',
};

class StandartSizedBox {
  static const standartSizedBox = SizedBox(width: AppSizes.standartWidth);
  static const standartSizedBoxBig = SizedBox(width: AppSizes.standartWidthBig);
  static const standartSizedBoxBigger =
      SizedBox(width: AppSizes.standartWidthBigger);
}
