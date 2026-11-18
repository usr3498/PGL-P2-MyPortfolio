import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/models/data/place_types.dart';
import 'package:ud2_t2_usr3498_navegacion/models/favourite_place.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/Crud_elemet_list_style.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/crud_icon_box.dart';

class AddElementsCrud extends StatefulWidget {
  const AddElementsCrud({super.key, required this.id});

  final int id;
  static Future<FavouritePlace?> show(BuildContext context, int id) =>
      showDialog<FavouritePlace>(context: context, builder: (_) => AddElementsCrud(id: id));

  @override
  State<AddElementsCrud> createState() => _AddElementsCrudState();
}

class _AddElementsCrudState extends State<AddElementsCrud> {
  final _name = TextEditingController();
  String? _type, _level, _island;
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
      FavouritePlace(id: widget.id, name: text, type: _type!, level: _level!, island: _island!),
    );
  }

  Widget _drop(String hint, List<String> items, String? value, ValueChanged<String> onChanged,
      [Color color = CrudElementStyles.grey]) {
    final missing = _submitted && value == null;
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: value,
        hint: Text(
          hint,
          style: CrudElementStyles.small.copyWith(color: missing ? CrudElementStyles.delete : null),
        ),
        isDense: true,
        dropdownColor: CrudElementStyles.background,
        iconEnabledColor: color,
        style: CrudElementStyles.dropdown(color),
        items: [for (final i in items) DropdownMenuItem(value: i, child: Text(i))],
        onChanged: (v) => setState(() => onChanged(v!)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CrudElementStyles.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CrudElementStyles.cardRadius)),
      title: Row(children: [
        const CrudIconBox(),
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
      ]),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
            _drop("Tipo de actividad", PlaceTypes.types, _type, (v) => _type = v),
            const Text('  -  ', style: CrudElementStyles.small),
            _drop("Dificultad", PlaceTypes.levels.keys.toList(), _level, (v) => _level = v,
                PlaceTypes.levels[_level] ?? CrudElementStyles.grey),
          ]),
          Row(children: [
            const Text('Isla - ', style: CrudElementStyles.small),
            _drop("Isla", PlaceTypes.islands, _island, (v) => _island = v),
          ]),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancelar")),
        FilledButton(
          style: CrudElementStyles.pillButton,
          onPressed: _save,
          child: const Text("Guardar", style: CrudElementStyles.pillText),
        ),
      ],
    );
  }
}