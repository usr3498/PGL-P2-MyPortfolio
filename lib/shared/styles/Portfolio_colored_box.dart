import 'package:flutter/widgets.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/header_portfolio_style.dart';

class MyColoredBox extends StatelessWidget {
  const MyColoredBox({
    super.key,
    required this.text,
    this.width = 190,
    this.height = 70,
    this.backgroundColor = AppHeadFootStyles.background,
    this.textColor = AppHeadFootStyles.textColor,
    this.fontSize = 18,
    this.margin = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
  });

  final String text;
  final double width;
  final double? height;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final EdgeInsetsGeometry margin;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}