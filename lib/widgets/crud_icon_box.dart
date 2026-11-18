import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/Crud_elemet_list_style.dart';

class CrudIconBox extends StatelessWidget {
  const CrudIconBox({super.key});

  @override
  Widget build(BuildContext context) => Container(
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
      );
}