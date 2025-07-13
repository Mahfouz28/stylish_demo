import 'package:flutter/material.dart';
import 'package:stylish_demo/core/appcolors.dart';

class CustomSignButton extends StatelessWidget {
  const CustomSignButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 350,
    this.height = 50,
  });

  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
