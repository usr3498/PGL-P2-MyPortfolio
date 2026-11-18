import 'package:flutter/material.dart';

class AppDrawerDark{

  AppDrawerDark._();

  static const Color textColor= Color.fromRGBO(240, 245, 240, 10);
  static const Color background = Color.fromRGBO(103, 178, 134, 1);

  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.09;

  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

}