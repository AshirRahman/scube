import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  // Brand Colors
  static const Color primary = Color(0xFF0096FC);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;
  static const Color red = Color(0xFFFF0000);
  static const Color grey = Color(0xFFB6B8D0);

  // Additional greys / neutrals (non-const because derived from Material shades)
  static final Color grey100 = Colors.grey.shade100;
  static final Color grey200 = Colors.grey.shade200;
  static final Color grey300 = Colors.grey.shade300;
  static final Color grey400 = Colors.grey.shade400;
  static final Color grey600 = Colors.grey.shade600;
  static final Color grey700 = Colors.grey.shade700;
  static final Color grey800 = Colors.grey.shade800;
  static final Color grey900 = Colors.grey.shade900;

  // Accent colors
  static const Color blue = Colors.blue;
  static const Color blueGrey = Colors.blueGrey;
  static const Color blueAccent = Colors.blueAccent;
  static const Color lightBlue = Colors.lightBlue;
  static const Color purpleAccent = Colors.purpleAccent;
  static const Color orange = Colors.orange;
  static const Color orangeAccent = Colors.orangeAccent;

  // Additional semantic variants
  static const Color redAccent = Colors.redAccent;

  // Semantic colors
  static const Color green = Colors.green;
}
