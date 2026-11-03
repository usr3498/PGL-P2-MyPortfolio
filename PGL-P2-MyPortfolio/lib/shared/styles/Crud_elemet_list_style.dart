import 'package:flutter/widgets.dart';
class CrudElemetList extends StatelessWidget {
  const CrudElemetList({
    super.key,
    required this.text,
    this.width = 300,
    this.height = 100,
    this.fontSize = 18,
    this.margin = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
  });

  final String text;
  final double width;
  final double? height;
  static const Color textColor = Color.fromRGBO(254, 255, 255, 0.923);
  static const Color background = Color.fromRGBO(2, 97, 65, 0.905);
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
        color: background,
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