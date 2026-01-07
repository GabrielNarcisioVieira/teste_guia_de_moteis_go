import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/suite_model.dart';

class CustomLargeSuiteCardWidget extends StatelessWidget {
  final SuiteModel suite;
  const CustomLargeSuiteCardWidget({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 250,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: context.surfaceColor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(suite.fotos.first, width: 320, height: 180, fit: BoxFit.cover),
          ),
          Text(
            suite.nome.toLowerCase(),
            style: GoogleFonts.openSans(
              textStyle: context.titleMedium,
              fontWeight: FontWeight.w600,
              color: context.onSurfaceVariant,
              height: 1.2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8),
            child: Column(
              children: [
                Row(
                  children: [

                    const SizedBox(width: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                      ],
                    ),
                  ],
                ),
                // Container(
                //   decoration: BoxDecoration(color: context.surfaceContainerHigh, borderRadius: BorderRadius.circular(12)),
                //   width: 180,
                //   height: 96,
                //   margin: EdgeInsets.only(top: 8),
                //   child: Column(
                //     children: [
                //       const SizedBox(height: 4),
                //       Text(
                //         '${motel.getMenorValorEDesconto().desconto.toStringAsFixed(0)}% de desconto',
                //         style: GoogleFonts.openSans(
                //           textStyle: context.titleMedium,
                //           fontSize: 16,
                //           fontWeight: FontWeight.w600,
                //           color: context.onSurfaceVariant,
                //           decoration: TextDecoration.underline,
                //         ),
                //       ),
                //       Divider(height: 8, endIndent: 20, indent: 20, color: context.surfaceColor),
                //       Text(
                //         'a partir de ${CurrencyUtils.format(motel.getMenorValorEDesconto().valor)}',
                //         style: GoogleFonts.openSans(
                //           textStyle: context.titleMedium,
                //           fontSize: 12,
                //           fontWeight: FontWeight.w400,
                //           color: context.onSurfaceVariant,
                //         ),
                //       ),
                //       const SizedBox(height: 6),
                //
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
