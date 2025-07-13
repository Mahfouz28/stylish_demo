import 'package:flutter/material.dart';
class BackgroundImages extends StatelessWidget {
  const BackgroundImages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage("assets/images/unsplash_fouVDmGXoPI.png"),
        fit: BoxFit.cover,
      ),
    );
  }
}
