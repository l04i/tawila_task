import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFACC15);
  static const Color accent = Color(0xFFF87171);
  static const Color secondary = Color(0xFF797980);
  static const Color background = Color(0xFFF3F4F6);
  static const Color text = Color(0xFF202020);
}

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static const TextStyle subHeading = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'Open Sans', //
    fontSize: 16.0,
    color: AppColors.secondary,
  );

  static const TextStyle smallBody = TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 14.0,
    color: AppColors.secondary,
  );
}
