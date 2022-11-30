enum CategoryType { cafe, hotel, museum, park, restaurant, other }

class FilterCategories {
  final int id;
  final String name;
  final CategoryType categoryType;
  final String imageCategory;

  FilterCategories({
    required this.id,
    required this.name,
    required this.categoryType,
    required this.imageCategory,
  });
}
