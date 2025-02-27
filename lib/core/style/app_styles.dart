import 'package:flutter/material.dart';
import 'package:movies/core/style/app_colors.dart';

class AppStyles {
  AppStyles._();
  static TextStyle style16Regular = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle style16Bold = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static TextStyle style18Bold = const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle style24Bold = const TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static TextStyle style14Regular = const TextStyle(
    color: AppColors.subTitleColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle style12Regular = const TextStyle(
    color: AppColors.subTitleColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
