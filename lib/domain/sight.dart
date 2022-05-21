enum SightType { cafe, hotel, museum, park, restaurant, other }

class Sight {
  final String name; // -  название достопримечательности
  final double lat; //- координаты места
  final double lon;
  final List<String> urls;
  final String details;
  final SightType type;

  Sight({
    required this.name,
    required this.lat,
    required this.lon,
    required this.urls,
    this.details = '',
    required this.type,
  });
}
