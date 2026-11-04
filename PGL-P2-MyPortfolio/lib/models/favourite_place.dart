class FavouritePlace {
  final int id;
  String name;
  String type;
  String level;
  String island;

  FavouritePlace({
    required this.id,
    required this.name,
    this.type = 'Tipo de actividad',
    this.level = 'Dificultad',
    this.island = 'Isla',
  });
}

typedef PlaceUpdate = void Function(
  FavouritePlace place, {
  String? name,
  String? type,
  String? level,
  String? island,
});