import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';

class CustomBadgeWidget extends StatelessWidget {
  const CustomBadgeWidget({super.key, required this.discountValue});

  final int discountValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: context.onPrimary,
        border: Border.all(color: context.successColor, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$discountValue% off',
        style: GoogleFonts.openSans(
          textStyle: context.labelSmall,
          color: context.successColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
