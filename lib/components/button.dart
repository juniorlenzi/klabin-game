import 'package:flutter/material.dart';
import 'package:klabin_game/components/text.component.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.label = '',
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.white,
    this.height = 0.065,
    this.width = 0.4,
    this.borderRadius = 50,
    this.fontSize = 4.5,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0,
  });

  final String label;
  final VoidCallback onPressed;

  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double width;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size.height * height,
        width: size.width * width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          //add bottom shaddow
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.4),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: AppText(
            label,
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
          ),
        ),
      ),
    );
  }
}
