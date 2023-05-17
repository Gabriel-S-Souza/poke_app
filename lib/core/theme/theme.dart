import 'package:flutter/material.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primaryColor,
    background: AppColors.backgroundColor,
  ),
  scaffoldBackgroundColor: const Color(0xFFF2F2F2),
);

class AppColors {
  static const Color primaryColor = Color(0xFFF2F2F2);
  static const Color backgroundColor = Color(0xFFF2F2F2);
}
