import 'package:flutter/material.dart';

class AppPortfolioScreensStyles{

  AppPortfolioScreensStyles._();

  static const Color background = Color.fromARGB(255, 255, 244, 207);
  static const Color textColor = Color.fromARGB(255, 0, 0, 0);

  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.7;

  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

}