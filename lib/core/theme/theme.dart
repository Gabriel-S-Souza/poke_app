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

  // Pokemon type
  static const Color bug = Color(0xFFA7B723);
  static const Color dark = Color(0xFF75574C);
  static const Color dragon = Color(0xFF7037FF);
  static const Color electric = Color(0xFFF9CF30);
  static const Color fairy = Color(0xFFE69EAC);
  static const Color fighting = Color(0xFFC12239);
  static const Color fire = Color(0xFFF57D31);
  static const Color flying = Color(0xFFA891EC);
  static const Color ghost = Color(0xFF70559B);
  static const Color normal = Color(0xFFAAA67F);
  static const Color grass = Color(0xFF74CB48);
  static const Color ground = Color(0xFFDEC16B);
  static const Color ice = Color(0xFF9AD6DF);
  static const Color poison = Color(0xFFA43E9E);
  static const Color psychic = Color(0xFFFB5584);
  static const Color rock = Color(0xFFB69E31);
  static const Color steel = Color(0xFFB7B9D0);
  static const Color water = Color(0xFF6493EB);
}
