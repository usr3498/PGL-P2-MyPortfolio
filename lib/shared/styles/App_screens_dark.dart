import 'package:flutter/material.dart';

class AppPortfolioScreensStyles{

  AppPortfolioScreensStyles._();

  static const Color textColorImg= Color.fromRGBO(154, 155, 154, 0.965);
  static const Color textColor= Color.fromRGBO(255, 255, 255, 1);
  static const Color background = Color.fromRGBO(4, 31, 28, 0.969);

  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.9;

  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

}