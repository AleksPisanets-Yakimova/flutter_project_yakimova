import 'package:places_yakimova_project/domain/filter_categories.dart';
import 'package:places_yakimova_project/ui/screen/const/assets.dart';

final List<FilterCategories> filterCategories = [
  FilterCategories(
    id: 0,
    name: 'Отель',
    categoryType: CategoryType.hotel,
    imageCategory: AppAssets.hotelSvg,
  ),
  FilterCategories(
    id: 1,
    name: 'Парк',
    categoryType: CategoryType.park,
    imageCategory: AppAssets.parkSvg,
  ),
  FilterCategories(
    id: 2,
    name: 'Ресторан',
    categoryType: CategoryType.restaurant,
    imageCategory: AppAssets.restourantSvg,
  ),
  FilterCategories(
    id: 3,
    name: 'Музей',
    categoryType: CategoryType.museum,
    imageCategory: AppAssets.museumSvg,
  ),
  FilterCategories(
    id: 4,
    name: 'Особое место',
    categoryType: CategoryType.other,
    imageCategory: AppAssets.particularPlaceSvg,
  ),
  FilterCategories(
    id: 5,
    name: 'Кафе',
    categoryType: CategoryType.cafe,
    imageCategory: AppAssets.cafeSvg,
  ),
];
