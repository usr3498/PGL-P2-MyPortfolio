import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/App_screens_dark.dart';

class CrudElementStyles {
  // Colores
  static const grey = Color(0xFFA0AAAF);
  static const background = Color(0xFF24343A);
  static const iconBackground = Color(0xFF4A8C78);
  static const iconColor = Colors.white;
  static const delete = Color(0xFFE5675C);
  static const pill = Color(0xFF2E7D67);

  // Estilos de texto
  static const small = TextStyle(color: grey, fontSize: 13);
  static const title = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
  static const pageTitle = TextStyle(
    fontSize: 24,
    color: AppPortfolioScreensStyles.textColor,
    fontWeight: FontWeight.bold,
  );
  static const counter = TextStyle(fontSize: 16, color: AppPortfolioScreensStyles.textColor);

  static TextStyle dropdown(Color color) =>
      TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w600);
  static TextStyle levelText(Color color) =>
      TextStyle(color: color, fontWeight: FontWeight.w600);

  // Proporciones
  static const double cardWidth = 360;
  static const double cardRadius = 20;
  static const double cardSpacing = 12;
  static const double iconBoxSize = 56;
  static const double iconBoxRadius = 12;
  static const double iconSize = 34;
  static const double headerSpacing = 10;
  static const double pagePadding = 16;

  // Botón en forma de píldora
  static final ButtonStyle pillButton = FilledButton.styleFrom(
    backgroundColor: pill,
    foregroundColor: Colors.white,
    shape: const StadiumBorder(),
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
    minimumSize: Size.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
  static const pillText = TextStyle(fontWeight: FontWeight.w600);
}