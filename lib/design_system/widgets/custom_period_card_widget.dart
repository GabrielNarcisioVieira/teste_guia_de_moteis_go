import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/periodo_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/utils/currency_utils.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_badge_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_base_card_widget.dart';

class CustomPeriodCardWidget extends StatelessWidget {
  final PeriodoModel periodo;
  final VoidCallback? onTap;

  const CustomPeriodCardWidget({super.key, required this.periodo, this.onTap});

  @override
  Widget build(BuildContext context) {
    final hasDiscount = periodo.desconto != null;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomBaseCardWidget(
        padding: const EdgeInsets.all(16),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          periodo.tempoFormatado,
                          style: GoogleFonts.openSans(
                            textStyle: context.labelSmall,
                            fontWeight: FontWeight.w400,
                            color: context.onSurfaceVariant,
                            fontSize: 22,
                          ),
                        ),
                        if (hasDiscount) ...[
                          const SizedBox(width: 8),
                          CustomBadgeWidget(discountValue: periodo.desconto!.toInt()),
                        ],
                      ],
                    ),
                    Row(
                      children: [
                        if (hasDiscount) ...[
                          Text(
                            CurrencyUtils.format(periodo.valor),
                            style: GoogleFonts.openSans(
                              fontSize: 22,
                              textStyle: context.labelSmall,
                              decoration: TextDecoration.lineThrough,
                              color: context.surfaceContainerHighest,
                              fontWeight: FontWeight.w400,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationColor: context.surfaceContainerHighest,
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                        Text(
                          CurrencyUtils.format(periodo.valorTotal),
                          style: GoogleFonts.openSans(
                            fontSize: 22,
                            textStyle: context.labelSmall,
                            color: context.onSurfaceVariant,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: context.onSurfaceVariant, size: 28),
            ],
          ),
        ),
      ),
    );
  }
}
