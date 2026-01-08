import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';

class CustomEmptyPageWidget extends StatelessWidget {
  final VoidCallback onClearFilters;

  const CustomEmptyPageWidget({super.key, required this.onClearFilters});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off_rounded, size: 80, color: context.onPrimary),
            const SizedBox(height: 24),

            Text(
              'Não foram encontradas suítes para os filtros informados',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                textStyle: context.titleMedium,
                color: context.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: onClearFilters,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.onPrimary,
                  foregroundColor: context.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: Text(
                  'Limpar filtros',
                  style: GoogleFonts.openSans(
                    textStyle: context.bodyMedium,
                    color: context.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
