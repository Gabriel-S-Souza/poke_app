import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primaryColor,
    background: AppColors.backgroundColor,
    secondary: AppColors.white,
    onSecondary: AppColors.greyDark,
    tertiary: AppColors.greyLight,
    onTertiary: AppColors.greyExtraLight,
    inversePrimary: AppColors.black,
  ),
  scaffoldBackgroundColor: const Color(0xFFF2F2F2),
  fontFamily: GoogleFonts.poppins().fontFamily,
  textTheme: TextTheme(
    headlineMedium: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.textDefaultColor,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.textDefaultColor,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.textDefaultColor,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 8,
      fontWeight: FontWeight.w400,
      color: AppColors.greyDark,
    ),
  ),
);

class AppColors {
  // Identity
  static const Color primaryColor = Color(0xFFDC0A2D);
  static const Color backgroundColor = Color(0xFFEFEFEF);
  static const Color textDefaultColor = Color(0xFF1D1D1D);

  // Grayscale
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF212121);
  static const Color greyDark = Color(0xFF666666);
  static const Color greyLight = Color(0xFFE0E0E0);
  static const Color greyExtraLight = Color(0xFFEFEFEF);
}
