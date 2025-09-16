import 'package:flutter/material.dart';

class CoutomOverlayText2 extends StatelessWidget {
  const CoutomOverlayText2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 125,
          left: 95,
          child: Text(
            "Find it here, buy it now!",
            style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
