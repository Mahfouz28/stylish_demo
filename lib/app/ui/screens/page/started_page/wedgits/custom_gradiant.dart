import 'package:flutter/material.dart';

class CustomGradiant extends StatelessWidget {
  const CustomGradiant({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 190),
      child: Container(
        width: double.infinity,
        height: 900,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            // ignore: deprecated_member_use
            colors: [Colors.black.withOpacity(.9), Colors.transparent],
          ),
        ),
      ),
    );
  }
}
