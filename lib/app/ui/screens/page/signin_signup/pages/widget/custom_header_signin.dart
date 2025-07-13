import 'package:flutter/material.dart';

class stylish_demoHeader extends StatelessWidget {
  const stylish_demoHeader({
    super.key,
    required this.headerText,
    this.color = Colors.black,
    this.fontSize = 36,
  });

  final String headerText;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        headerText,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}
