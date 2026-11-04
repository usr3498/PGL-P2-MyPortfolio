import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/models/favourite_place.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/App_screens_dark.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/Crud_elemet_list_style.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/Drawer.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/crud_element_style.dart';

class CrudPage extends StatefulWidget {
  const CrudPage({super.key});

  @override
  State<CrudPage> createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  final List<FavouritePlace> _places = [
    FavouritePlace(id: 1, name: "La caldera"),
    FavouritePlace(id: 2, name: "Bajamar"),
    FavouritePlace(id: 3, name: "Las mesas"),
    FavouritePlace(id: 4, name: "Teresitas"),
    FavouritePlace(id: 5, name: "La salinas"),
    FavouritePlace(id: 6, name: "Siam Park"),
    FavouritePlace(id: 7, name: "Las gaviotas"),
    FavouritePlace(id: 8, name: "Punta de teno"),
  ];
  int _nextId = 9;
  bool _deleteMode = false;

  void _add() => setState(() {
        final id = _nextId++;
        _places.insert(0, FavouritePlace(id: id, name: "Nuevo lugar $id"));
      });

  void _update(FavouritePlace place, {String? name, String? type, String? level, String? island}) =>
      setState(() {
        if (name != null && name.trim().isNotEmpty) place.name = name.trim();
        if (type != null) place.type = type;
        if (level != null) place.level = level;
        if (island != null) place.island = island;
      });

  void _delete(int id) => setState(() {
        _places.removeWhere((p) => p.id == id);
        _deleteMode = false;
      });

  Widget _pill(String label, VoidCallback onTap) => FilledButton(
        onPressed: onTap,
        style: CrudElementStyles.pillButton,
        child: Text(label, style: CrudElementStyles.pillText),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: AppPortfolioScreensStyles.background,
        foregroundColor: AppPortfolioScreensStyles.textColor,
      ),
      body: Container(
        color: AppPortfolioScreensStyles.background,
        padding: const EdgeInsets.symmetric(vertical: CrudElementStyles.pagePadding),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: CrudElementStyles.pagePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Sergio Morales Díaz", style: CrudElementStyles.pageTitle),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: CrudElementStyles.headerSpacing,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text("Nº total de cards: ${_places.length}", style: CrudElementStyles.counter),
                        _pill("Añadir", _add),
                        _pill(
                          _deleteMode ? "Cancelar" : "Eliminar",
                          () => setState(() => _deleteMode = !_deleteMode),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: CrudElementStyles.pagePadding),
            Expanded(
              child: ListView.builder(
                itemCount: _places.length,
                itemBuilder: (_, i) {
                  final place = _places[i];
                  return Center(
                    child: CrudElemetList(
                      key: ValueKey(place.id),
                      place: place,
                      showDelete: _deleteMode,
                      onUpdate: _update,
                      onDelete: () => _delete(place.id),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}