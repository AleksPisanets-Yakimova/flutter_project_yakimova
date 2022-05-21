import 'package:places_yakimova_project/domain/sight.dart';

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
  static const String title = 'Flutter Demo';
}

const mapSightTypeToString = {
  SightType.other: 'другое',
  SightType.cafe: 'кафе',
  SightType.hotel: 'отель',
  SightType.museum: 'музей',
  SightType.park: 'парк',
  SightType.restaurant: 'ресторан',
};
