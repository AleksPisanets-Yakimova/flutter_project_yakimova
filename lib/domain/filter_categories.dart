import 'package:places_yakimova_project/domain/sight.dart';

enum CategoryType { cafe, hotel, museum, park, restaurant, other }

class FilterCategories {
  final int id;
  final String name;
  final CategoryType categoryType;
  final String imageCategory;
  final SightType type;

  FilterCategories({
    required this.id,
    required this.name,
    required this.categoryType,
    required this.imageCategory,
    required this.type,
  });
}
