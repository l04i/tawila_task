import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  static const Color primary = Color(0xFFFACC15);
  static const Color accent = Color(0xFFF87171);
  static const Color secondary = Color(0xFFFAFAFA);
  static const Color background = Color(0xFFF3F4F6);
  static const Color lightBackground = Color(0xFFF3F4F6);
  static const Color text = Color(0xFF202020);
  static const Color icons = Color(0xFF202020);
}

class AppTextStyles {
  static TextStyle heading = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static TextStyle subHeading = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static TextStyle body = TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 16.sp,
    color: AppColors.secondary,
  );

  static TextStyle smallBody = TextStyle(
    fontFamily: 'Open Sans',
    fontSize: 14.sp,
    color: AppColors.secondary,
  );
}

class AppAssets {
  static const String appLogo = 'assets/images/tawila_logo.png';
}
