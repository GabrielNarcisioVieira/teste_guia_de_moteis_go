import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/theme/app_colors.dart';

void main() {
  group('AppColors', () {
    test('Deve garantir que as cores principais possuem o valor hexadecimal correto', () {
      expect(AppColors.primaryRed, const Color(0xFFD11621));
      expect(AppColors.secondaryRed, const Color(0xFFB8000C));
      expect(AppColors.white, const Color(0xFFFFFFFF));
      expect(AppColors.black, const Color(0xFF1C1C1C));
      expect(AppColors.success, const Color(0xFF1BB98E));
    });

    test('Deve garantir que a paleta de cinzas está correta', () {
      expect(AppColors.greyBackground, const Color(0xFFF8F9FB));
      expect(AppColors.greyLight, const Color(0xFFC2C2C2));
      expect(AppColors.greyDark, const Color(0xFF4E4E4E));
    });
  });
}