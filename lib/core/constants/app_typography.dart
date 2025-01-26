import 'package:flutter/material.dart';
import 'package:kawika_machine_test/core/constants/app_colors.dart';

class AppTypography {
  static const TextStyle headline =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const TextStyle title =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle subTitle = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: AppColors.textColors.withAlpha((.5 * 255).toInt()));
  static const body1 = TextStyle(fontSize: 14, color: AppColors.textColors);
  static const TextStyle appBarTitle = TextStyle(
      color: AppColors.textColors, fontSize: 16, fontWeight: FontWeight.w700);
  static const TextStyle cardTitle = TextStyle(
      color: AppColors.textColors, fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle cardSubTitle = TextStyle(
      color: AppColors.textColors.withAlpha((.5 * 255).toInt()),
      fontSize: 10,
      fontWeight: FontWeight.w400);
  static TextStyle cardContent = TextStyle(
      color: AppColors.textColors, fontSize: 10, fontWeight: FontWeight.w400);
}
