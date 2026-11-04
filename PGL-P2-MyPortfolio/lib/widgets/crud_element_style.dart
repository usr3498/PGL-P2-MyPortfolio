import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/models/data/place_types.dart';
import 'package:ud2_t2_usr3498_navegacion/models/favourite_place.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/Crud_elemet_list_style.dart';

class CrudElemetList extends StatefulWidget {
  const CrudElemetList({
    super.key,
    required this.place,
    required this.onUpdate,
    required this.onDelete,
    this.showDelete = false,
  });

  final FavouritePlace place;
  final PlaceUpdate onUpdate;
  final VoidCallback onDelete;
  final bool showDelete;

  @override
  State<CrudElemetList> createState() => _CrudElemetListState();
}

class _CrudElemetListState extends State<CrudElemetList> {
  // Borrador: solo se usa mientras se edita
  final _name = TextEditingController();
  late String _type, _level, _island;
  bool _editing = false;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    final p = widget.place;
    if (_editing) {
      widget.onUpdate(p, name: _name.text, type: _type, level: _level, island: _island);
    } else {
      _name.text = p.name;
      _type = p.type;
      _level = p.level;
      _island = p.island;
    }
    setState(() => _editing = !_editing);
  }

  Widget _drop(String value, List<String> items, ValueChanged<String> onChanged,
          [Color color = CrudElementStyles.grey]) =>
      DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
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
    final p = widget.place;
    final color = PlaceTypes.levels[_editing ? _level : p.level]!;
    return Container(
      width: CrudElementStyles.cardWidth,
      margin: const EdgeInsets.only(bottom: CrudElementStyles.cardSpacing),
      decoration: BoxDecoration(
        color: CrudElementStyles.background,
        borderRadius: BorderRadius.circular(CrudElementStyles.cardRadius),
      ),
      child: ListTile(
        isThreeLine: true,
        leading: Container(
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
        title: _editing
            ? TextField(
                controller: _name,
                style: CrudElementStyles.title,
                cursorColor: Colors.white,
                decoration: const InputDecoration(isDense: true),
              )
            : Text(p.name, style: CrudElementStyles.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _editing
              ? [
                  Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                    _drop(_type, PlaceTypes.types, (v) => _type = v),
                    const Text('  -  ', style: CrudElementStyles.small),
                    _drop(_level, PlaceTypes.levels.keys.toList(), (v) => _level = v, color),
                  ]),
                  Row(children: [
                    const Text('Isla - ', style: CrudElementStyles.small),
                    _drop(_island, PlaceTypes.islands, (v) => _island = v),
                  ]),
                ]
              : [
                  Text.rich(TextSpan(style: CrudElementStyles.small, children: [
                    TextSpan(text: '${p.type} - '),
                    TextSpan(text: p.level, style: CrudElementStyles.levelText(color)),
                  ])),
                  Text('Isla - ${p.island}', style: CrudElementStyles.small),
                ],
        ),
        trailing: widget.showDelete
            ? IconButton(
                icon: const Icon(Icons.delete_rounded),
                color: CrudElementStyles.delete,
                onPressed: widget.onDelete,
              )
            : IconButton(
                icon: Icon(_editing ? Icons.check_rounded : Icons.chevron_right_rounded),
                color: _editing ? color : CrudElementStyles.grey,
                onPressed: _toggleEdit,
              ),
      ),
    );
  }
}