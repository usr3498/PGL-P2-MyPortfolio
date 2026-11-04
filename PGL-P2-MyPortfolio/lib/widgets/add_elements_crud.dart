import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/models/data/place_types.dart';
import 'package:ud2_t2_usr3498_navegacion/models/favourite_place.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/Crud_elemet_list_style.dart';

class AddElementsCrud extends StatefulWidget {
  const AddElementsCrud({super.key, required this.id});

  final int id;

  /// Abre el diálogo. Devuelve el lugar creado, o null si se cancela.
  static Future<FavouritePlace?> show(BuildContext context, int id) =>
      showDialog<FavouritePlace>(
        context: context,
        builder: (_) => AddElementsCrud(id: id),
      );

  @override
  State<AddElementsCrud> createState() => _AddElementsCrudState();
}

class _AddElementsCrudState extends State<AddElementsCrud> {
  final _name = TextEditingController();
  String? _type;
  String? _level;
  String? _island;
  bool _submitted = false;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  void _save() {
    final text = _name.text.trim();
    if (text.isEmpty || _type == null || _level == null || _island == null) {
      setState(() => _submitted = true);
      return;
    }
    Navigator.pop(
      context,
      FavouritePlace(
        id: widget.id,
        name: text,
        type: _type!,
        level: _level!,
        island: _island!,
      ),
    );
  }

  Widget _drop(String hint, List<String> items, String? value, ValueChanged<String> onChanged,
          [Color color = CrudElementStyles.grey]) =>
      DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(
            hint,
            style: _submitted && value == null
                ? CrudElementStyles.small.copyWith(color: CrudElementStyles.delete)
                : CrudElementStyles.small,
          ),
          isDense: true,
          dropdownColor: CrudElementStyles.background,
          iconEnabledColor: color,
          style: CrudElementStyles.dropdown(color),
          items: [for (final i in items) DropdownMenuItem(value: i, child: Text(i))],
          onChanged: (v) => setState(() => onChanged(v!)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: CrudElementStyles.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CrudElementStyles.cardRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(CrudElementStyles.pagePadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: CrudElementStyles.iconBoxSize,
                  height: CrudElementStyles.iconBoxSize,
                  decoration: BoxDecoration(
                    color: CrudElementStyles.iconBackground,
                    borderRadius: BorderRadius.circular(CrudElementStyles.iconBoxRadius),
                  ),
                  child: const Icon(
                    Icons.landscape_rounded,
                    color: CrudElementStyles.iconColor,
                    size: CrudElementStyles.iconSize,
                  ),
                ),
                const SizedBox(width: CrudElementStyles.pagePadding),
                Expanded(
                  child: TextField(
                    controller: _name,
                    autofocus: true,
                    style: CrudElementStyles.title,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: "Nombre del lugar",
                      hintStyle: CrudElementStyles.small,
                      errorText: _submitted && _name.text.trim().isEmpty ? "Obligatorio" : null,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: CrudElementStyles.headerSpacing),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                _drop("Tipo de actividad", PlaceTypes.types, _type, (v) => _type = v),
                const Text('  -  ', style: CrudElementStyles.small),
                _drop(
                  "Dificultad",
                  PlaceTypes.levels.keys.toList(),
                  _level,
                  (v) => _level = v,
                  PlaceTypes.levels[_level] ?? CrudElementStyles.grey,
                ),
              ],
            ),
            Row(
              children: [
                const Text('Isla - ', style: CrudElementStyles.small),
                _drop("Isla", PlaceTypes.islands, _island, (v) => _island = v),
              ],
            ),
            const SizedBox(height: CrudElementStyles.pagePadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar"),
                ),
                const SizedBox(width: CrudElementStyles.headerSpacing),
                FilledButton(
                  style: CrudElementStyles.pillButton,
                  onPressed: _save,
                  child: const Text("Guardar", style: CrudElementStyles.pillText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}