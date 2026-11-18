import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/models/data/place_types.dart';
import 'package:ud2_t2_usr3498_navegacion/models/favourite_place.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/Crud_elemet_list_style.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/crud_icon_box.dart';

class CrudElemetList extends StatelessWidget {
  const CrudElemetList({
    super.key,
    required this.place,
    required this.onDelete,
    this.showDelete = false,
  });

  final FavouritePlace place;
  final VoidCallback onDelete;
  final bool showDelete;

  @override
  Widget build(BuildContext context) {
    final color = PlaceTypes.levels[place.level]!;
    return Container(
      width: CrudElementStyles.cardWidth,
      margin: const EdgeInsets.only(bottom: CrudElementStyles.cardSpacing),
      decoration: BoxDecoration(
        color: CrudElementStyles.background,
        borderRadius: BorderRadius.circular(CrudElementStyles.cardRadius),
      ),
      child: ListTile(
        isThreeLine: true,
        leading: const CrudIconBox(),
        title: Text(place.name, style: CrudElementStyles.title),
        subtitle: Text.rich(TextSpan(style: CrudElementStyles.small, children: [
          TextSpan(text: '${place.type} - '),
          TextSpan(text: place.level, style: CrudElementStyles.levelText(color)),
          TextSpan(text: '\nIsla - ${place.island}'),
        ])),
        trailing: showDelete
            ? IconButton(
                icon: const Icon(Icons.delete_rounded),
                color: CrudElementStyles.delete,
                onPressed: onDelete,
              )
            : null,
      ),
    );
  }
}