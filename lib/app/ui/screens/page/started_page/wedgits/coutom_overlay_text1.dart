import 'package:flutter/material.dart';

class CoutomOverlayText1 extends StatelessWidget {
  const CoutomOverlayText1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 160,
          left: 60,
          child: Text(
            "You want\n Authentic, here\n you go!",
            style: TextStyle(
              fontSize: 34,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
