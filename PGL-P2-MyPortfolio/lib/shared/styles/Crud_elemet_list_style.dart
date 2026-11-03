import 'package:flutter/material.dart';

class CrudElemetList extends StatefulWidget {
  const CrudElemetList({
    super.key,
    required this.text,
    this.width = 360,
    this.margin = EdgeInsets.zero,
    this.showDelete = false,
    this.onDelete,
  });

  final String text;
  final double width;
  final EdgeInsetsGeometry margin;
  final bool showDelete;
  final VoidCallback? onDelete;

  @override
  State<CrudElemetList> createState() => _CrudElemetListState();
}

class _CrudElemetListState extends State<CrudElemetList> {
  static const _levels = {
    'Dificultad': Color.fromARGB(255, 236, 238, 237),
    'Fácil': Color(0xFF6CCB9B),
    'Intermedio': Color(0xFFF2B94B),
    'Difícil': Color(0xFFE5675C),
  };
  static const _types = [
    'Tipo de actividad', 'Playa', 'Caminata', 'Miradores', 'Acampadas', 'Tirolinas', 'Rutas coche', 'Lugares interesantes',
  ];
  static const _islands = [
    'Isla', 'Tenerife', 'Gran Canaria', 'Lanzarote', 'Fuerteventura', 'La Palma', 'La Gomera', 'El Hierro',
  ];
  static const _grey = Color(0xFFA0AAAF);
  static const _bg = Color(0xFF24343A);
  static const _small = TextStyle(color: _grey, fontSize: 13);
  static const _titleStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

  late final _name = TextEditingController(text: widget.text);
  String _type = 'Tipo de actividad';
  String _level = 'Dificultad';
  String _island = 'Isla';
  bool _editing = false;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Widget _drop(String value, List<String> items, ValueChanged<String> onChanged, [Color color = _grey]) =>
      DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isDense: true,
          dropdownColor: _bg,
          iconEnabledColor: color,
          style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w600),
          items: [for (final i in items) DropdownMenuItem(value: i, child: Text(i))],
          onChanged: (v) => setState(() => onChanged(v!)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final color = _levels[_level]!;
    return Container(
      width: widget.width,
      margin: widget.margin,
      decoration: BoxDecoration(color: _bg, borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        isThreeLine: true,
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(color: const Color(0xFF4A8C78), borderRadius: BorderRadius.circular(12)),
          child: const Icon(Icons.landscape_rounded, color: Colors.white, size: 34),
        ),
        title: _editing
            ? TextField(
                controller: _name,
                style: _titleStyle,
                cursorColor: Colors.white,
                decoration: const InputDecoration(isDense: true),
              )
            : Text(_name.text, style: _titleStyle),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _editing
              ? [
                  Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                    _drop(_type, _types, (v) => _type = v),
                    const Text('  -  ', style: _small),
                    _drop(_level, _levels.keys.toList(), (v) => _level = v, color),
                  ]),
                  Row(children: [
                    const Text('Isla - ', style: _small),
                    _drop(_island, _islands, (v) => _island = v),
                  ]),
                ]
              : [
                  Text.rich(TextSpan(style: _small, children: [
                    TextSpan(text: '$_type - '),
                    TextSpan(text: _level, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
                  ])),
                  Text('Isla - $_island', style: _small),
                ],
        ),
        trailing: widget.showDelete
            ? IconButton(
                icon: const Icon(Icons.delete_rounded),
                color: const Color(0xFFE5675C),
                onPressed: widget.onDelete,
              )
            : IconButton(
                icon: Icon(_editing ? Icons.check_rounded : Icons.chevron_right_rounded),
                color: _editing ? color : _grey,
                onPressed: () => setState(() => _editing = !_editing),
              ),
      ),
    );
  }
}