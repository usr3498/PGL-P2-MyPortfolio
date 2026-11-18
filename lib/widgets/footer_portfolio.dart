import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/header_portfolio_style.dart';

class Footer extends StatelessWidget {
  final VoidCallback onMainPage;
  final VoidCallback onSecondPage;

  const Footer({
    super.key,
    required this.onMainPage,
    required this.onSecondPage,
  });

  Widget _button(String text, VoidCallback onPressed) {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppHeadFootStyles.background,
          border: Border.all(color: AppHeadFootStyles.textColor, width: 2),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: AppHeadFootStyles.textColor,
                fontSize: 24,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: AppHeadFootStyles.background,
      child: Row(
        children: [
          _button("Main", onMainPage),
          _button("PaginaQR", onSecondPage),
        ],
      ),
    );
  }
}