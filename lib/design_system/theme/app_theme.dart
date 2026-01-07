import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = _buildLightTheme();

  static const _baseTextTheme = TextTheme(
    // Título do Motel (Large Card)
    headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.black),
    // Nome da Suíte
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.black),
    // Preços e Títulos médios
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    // Texto de Bairros/Distância
    bodyMedium: TextStyle(fontSize: 14, color: AppColors.greyMedium),
    // Rating Count e textos pequenos
    labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.greyMedium),
  );

  static ThemeData _buildLightTheme() {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryRed,
      primary: AppColors.primaryRed,
      onPrimary: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.black,
      error: AppColors.primaryRed,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.greyBackground,
      textTheme: _baseTextTheme,

      /// AppBar: CustomAppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryRed,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),

      /// Botões: CustomButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryRed,
          foregroundColor: AppColors.white,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),

      /// Chips: CustomFilterChip
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

      /// Cards: CustomSmallMotelCard, CustomLargeMotelCard
      cardTheme: CardTheme(
        color: AppColors.white,
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      /// Dropdown: CustomDropdown
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.greyLight)),
      ),

      /// Checkbox/Switch: CustomSwitchButton
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected) ? AppColors.white : AppColors.greyMedium,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected) ? AppColors.primaryRed : AppColors.greyLight,
        ),
      ),
    );
  }
}
