import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/header_portfolio_style.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      color: AppHeadFootStyles.background,
      child: Center(
        child: Text(
          "Este es mi portfolio",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 20,
            color: AppHeadFootStyles.textColor,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}