import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/App_screens_dark.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/Crud_elemet_list_style.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/Drawer.dart';

class CrudPage extends StatefulWidget {
  const CrudPage({super.key});

  @override
  State<CrudPage> createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  final List<({int id, String name})> _places = [
    (id: 1, name: "La caldera"),
    (id: 2, name: "Bajamar"),
    (id: 3, name: "Las mesas"),
    (id: 4, name: "Teresitas"),
    (id: 5, name: "La salinas"),
    (id: 6, name: "Siam Park"),
    (id: 7, name: "Las gaviotas"),
    (id: 8, name: "Punta de teno"),
  ];
  int _nextId = 9;
  bool _deleteMode = false;

  void _add() => setState(() {
        _places.insert(0, (id: _nextId, name: "Nuevo lugar $_nextId"));
        _nextId++;
      });

  void _delete(int id) => setState(() {
        _places.removeWhere((p) => p.id == id);
        _deleteMode = false;
      });

  Widget _pill(String label, VoidCallback onTap) => FilledButton(
        onPressed: onTap,
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF2E7D67),
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
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
        width: double.infinity,
        color: AppPortfolioScreensStyles.background,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sergio Morales Díaz",
                        style: TextStyle(
                          fontSize: 24,
                          color: AppPortfolioScreensStyles.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 10,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            "Nº total de cards: ${_places.length}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppPortfolioScreensStyles.textColor,
                            ),
                          ),
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
              const SizedBox(height: 16),
              ..._places.map(
                (place) => CrudElemetList(
                  key: ValueKey(place.id),
                  text: place.name,
                  margin: const EdgeInsets.only(bottom: 12),
                  showDelete: _deleteMode,
                  onDelete: () => _delete(place.id),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}