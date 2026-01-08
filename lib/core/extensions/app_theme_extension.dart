import 'package:flutter/material.dart';

extension AppThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;

  Color get primaryColor => colorScheme.primary;
  Color get primaryContainer => colorScheme.primaryContainer;
  Color get secondaryColor => colorScheme.secondary;
  Color get tertiaryColor => colorScheme.tertiary;
  Color get successColor => colorScheme.outlineVariant;

  Color get surfaceColor => colorScheme.surface;
  Color get surfaceContainerHigh => colorScheme.surfaceContainerHigh;
  Color get surfaceContainerHighest => colorScheme.surfaceContainerHighest;
  Color get surfaceContainerLowest => colorScheme.surfaceContainerLowest;

  Color get errorColor => colorScheme.error;
  Color get outlineColor => colorScheme.outline;
  Color get shadowColor => colorScheme.shadow;

  Color get onPrimary => colorScheme.onPrimary;
  Color get onSecondary => colorScheme.onSecondary;
  Color get onTertiary => colorScheme.onTertiary;
  Color get onSurface => colorScheme.onSurface;
  Color get onSurfaceVariant => colorScheme.onSurfaceVariant;
  Color get onError => colorScheme.onError;

  TextStyle? get headlineSmall => textTheme.headlineSmall;
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get labelSmall => textTheme.labelSmall;
}