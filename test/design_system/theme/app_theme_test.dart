import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/theme/app_theme.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/theme/app_colors.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('AppTheme - lightTheme', () {
    testWidgets('Deve configurar o ColorScheme corretamente a partir das AppColors', (WidgetTester tester) async {
      GoogleFonts.config.allowRuntimeFetching = false;

      final theme = AppTheme.lightTheme;

      expect(theme.colorScheme.primary, AppColors.primaryRed);
      expect(theme.colorScheme.surface, AppColors.white);
      expect(theme.colorScheme.secondary, AppColors.accentGold);
      expect(theme.colorScheme.outlineVariant, AppColors.success);
      expect(theme.brightness, Brightness.light);
    });

    test('Deve configurar a tipografia (TextTheme) com os estilos corretos', () {
      final theme = AppTheme.lightTheme;
      expect(theme.textTheme.headlineSmall?.fontSize, 20);
      expect(theme.textTheme.headlineSmall?.fontWeight, FontWeight.bold);
      expect(theme.textTheme.headlineSmall?.color, AppColors.black);
      expect(theme.textTheme.titleLarge?.fontSize, 18);
      expect(theme.textTheme.titleLarge?.fontWeight, FontWeight.w600);
      expect(theme.textTheme.labelSmall?.fontSize, 12);
    });

    test('Deve configurar corretamente o AppBarTheme', () {
      final theme = AppTheme.lightTheme;
      expect(theme.appBarTheme.backgroundColor, AppColors.primaryRed);
      expect(theme.appBarTheme.centerTitle, isTrue);
      expect(theme.appBarTheme.elevation, 0);
    });

    test('Deve configurar corretamente o ElevatedButtonTheme', () {
      final theme = AppTheme.lightTheme;
      final buttonStyle = theme.elevatedButtonTheme.style;

      expect(buttonStyle?.backgroundColor?.resolve({}), AppColors.primaryRed);
      expect(buttonStyle?.foregroundColor?.resolve({}), AppColors.white);

      final shape = buttonStyle?.shape?.resolve({}) as RoundedRectangleBorder;
      expect(shape.borderRadius, BorderRadius.circular(8));
    });

    test('Deve possuir ScaffoldBackgroundColor como greyBackground', () {
      final theme = AppTheme.lightTheme;
      expect(theme.scaffoldBackgroundColor, AppColors.greyBackground);
    });
  });
}