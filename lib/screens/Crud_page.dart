import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/models/favourite_place.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/App_screens_dark.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/Crud_elemet_list_style.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/Drawer.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/add_elements_crud.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/crud_element_list.dart';

class CrudPage extends StatefulWidget {
  const CrudPage({super.key});

  @override
  State<CrudPage> createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  final List<FavouritePlace> _places = [
    const FavouritePlace(id: 1, name: "La caldera", type: "Caminata", level: "Difícil", island: "La Palma"),
    const FavouritePlace(id: 2, name: "Bajamar", type: "Playa", level: "Fácil", island: "La Palma"),
    const FavouritePlace(id: 7, name: "Las gaviotas", type: "Playa", level: "Fácil", island: "Tenerife"),
    const FavouritePlace(id: 8, name: "Punta de teno", type: "Lugares interesantes", level: "Intermedio", island: "Tenerife"),
  ];
  int _nextId = 9;
  bool _deleteMode = false;

  Future<void> _add() async {
    final place = await AddElementsCrud.show(context, _nextId);
    if (place == null || !mounted) return;
    setState(() {
      _places.insert(0, place);
      _nextId++;
    });
  }

  void _delete(int id) => setState(() {
        _places.removeWhere((p) => p.id == id);
        _deleteMode = false;
      });

  Widget _pillbtn(String label, VoidCallback onTap) => FilledButton(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
                      _pillbtn("Añadir", _add),
                      _pillbtn(_deleteMode ? "Cancelar" : "Eliminar",
                          () => setState(() => _deleteMode = !_deleteMode)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: CrudElementStyles.pagePadding),
            Expanded(
              child: ListView.builder(
                itemCount: _places.length,
                itemBuilder: (_, i) => Center(
                  child: CrudElemetList(
                    key: ValueKey(_places[i].id),
                    place: _places[i],
                    showDelete: _deleteMode,
                    onDelete: () => _delete(_places[i].id),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}