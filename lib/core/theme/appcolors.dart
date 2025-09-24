import 'package:flutter/material.dart';

class AppColors {
  // الألوان الأساسية
  static const Color kPrimaryColor = Color(0xffF83758);
  static const Color lightGray = Color(0xffBBBBBB);
  static const Color pink = Color(0xffFFA3B3);
  static const Color lightRed = Color(0xffFE735C);

  // ألوان إضافية
  static const Color darkGray = Color(0xff444444);
  static const Color background = Color(0xffF9F9F9);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  // Gradient جاهز للاستخدام
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [kPrimaryColor, lightRed],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
