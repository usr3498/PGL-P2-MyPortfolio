import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/models/data/place_types.dart';
import 'package:ud2_t2_usr3498_navegacion/models/favourite_place.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/Crud_elemet_list_style.dart';

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
    final color = PlaceTypes.levels[place.level] ?? CrudElementStyles.grey;
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
        title: Text(place.name, style: CrudElementStyles.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(style: CrudElementStyles.small, children: [
              TextSpan(text: '${place.type} - '),
              TextSpan(text: place.level, style: CrudElementStyles.levelText(color)),
            ])),
            Text(
              place.island == 'Isla' ? 'Isla' : 'Isla - ${place.island}',
              style: CrudElementStyles.small,
            ),
          ],
        ),
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