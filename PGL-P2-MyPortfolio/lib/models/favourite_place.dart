class FavouritePlace {
  final int id;
  String name;
  String type;
  String level;
  String island;

  FavouritePlace({
    required this.id,
    required this.name,
    required this.type,
    required this.level,
    required this.island,
  });
}

typedef PlaceUpdate = void Function(
  FavouritePlace place, {
  String? name,
  String? type,
  String? level,
  String? island,
});