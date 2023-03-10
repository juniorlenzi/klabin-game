//return text widget
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.fontFamily = 'MinionPro',
    this.fontWeight = FontWeight.normal,
    this.fontSize = 4.5,
    this.color = Colors.white,
    this.letterSpacing = 0,
    this.textAlign = TextAlign.left,
  });

  final String text;
  final String fontFamily;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final double letterSpacing;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: size.width * (fontSize / 100),
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
