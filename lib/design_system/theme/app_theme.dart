import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = _buildLightTheme();

  static final _baseTextTheme = TextTheme(
    headlineSmall: GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.black),
    titleLarge: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.black),
    titleMedium: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.greyDark),
    bodyMedium: GoogleFonts.openSans(fontSize: 14, color: AppColors.greyMedium),
    labelSmall: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.greyMedium),
  );

  static ThemeData _buildLightTheme() {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryRed,
      primary: AppColors.primaryRed,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.secondaryRed,
      onPrimaryContainer: AppColors.white,
      secondary: AppColors.accentGold,
      onSecondary: AppColors.black,
      tertiary: AppColors.tertiaryRed,
      onTertiary: AppColors.white,
      surface: AppColors.white,
      surfaceContainerHigh: AppColors.greyBackground,
      onSurface: AppColors.black,
      surfaceContainerHighest: AppColors.greyLight,
      surfaceContainerLowest: AppColors.greyLight2,
      onSurfaceVariant: AppColors.greyDark,
      outline: AppColors.grey2,
      shadow: AppColors.grey,
      error: AppColors.secondaryRed,
      onError: AppColors.white,
      brightness: Brightness.light,
      outlineVariant: AppColors.success
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.greyBackground,
      textTheme: _baseTextTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryRed,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryRed,
          foregroundColor: AppColors.white,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.white,
        selectedColor: AppColors.primaryRed,
        disabledColor: AppColors.greyLight,
        secondarySelectedColor: AppColors.primaryRed,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        labelStyle: const TextStyle(fontSize: 13, color: AppColors.black),
        secondaryLabelStyle: const TextStyle(color: AppColors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: AppColors.greyLight)),
      ),
      cardTheme: CardTheme(
        color: AppColors.white,
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.greyLight)),
      ),
    );
  }
}
