import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/motel_price_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/motel_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/utils/currency_utils.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_button_widget.dart';

class CustomSmallMotelCardWidget extends StatelessWidget {
  final MotelModel motel;

  const CustomSmallMotelCardWidget({super.key, required this.motel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 372,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              motel.suites.first.fotos.first,
              width: 164,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/fire_icon.svg', height: 20),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  motel.fantasia.toLowerCase(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.openSans(
                                    textStyle: context.titleMedium,
                                    fontWeight: FontWeight.w600,
                                    color: context.onSurfaceVariant,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  motel.bairro.toLowerCase(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.openSans(
                                    textStyle: context.labelSmall,
                                    fontWeight: FontWeight.w400,
                                    color: context.onSurfaceVariant,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: context.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: 190,
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          '${motel.getMenorValorEDesconto().desconto.toStringAsFixed(0)}% de desconto',
                          style: GoogleFonts.openSans(
                            textStyle: context.titleMedium,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: context.onSurfaceVariant,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Divider(height: 8, endIndent: 20, indent: 20, color: context.surfaceColor),
                        Text(
                          'a partir de ${CurrencyUtils.format(motel.getMenorValorEDesconto().valor)}',
                          style: GoogleFonts.openSans(
                            textStyle: context.titleMedium,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: context.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 6),
                        CustomButtonWidget(
                          height: 35,
                          radius: 4,
                          label: 'reservar',
                          icon: Icons.chevron_right,
                          foregroundColor: context.surfaceColor,
                          backgroundColor: context.successColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
