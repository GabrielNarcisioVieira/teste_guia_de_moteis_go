import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/motel_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/suite_model.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_carousel_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_large_motel_card/custom_large_suite_card_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_outline_dropdown_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_rating_badge_widget.dart';

class CustomLargeMotelCardWidget extends StatelessWidget {
  final MotelModel motel;

  const CustomLargeMotelCardWidget({super.key, required this.motel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.onSurface,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(radius: 20, child: ClipRRect(borderRadius: BorderRadius.circular(30), child: Image.network(motel.logo))),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      motel.fantasia.toLowerCase(),
                      style: GoogleFonts.openSans(
                        textStyle: context.headlineSmall,
                        fontWeight: FontWeight.w500,
                        color: context.onSurfaceVariant,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      motel.bairro.toLowerCase(),
                      style: GoogleFonts.openSans(
                        textStyle: context.labelSmall,
                        fontWeight: FontWeight.w400,
                        color: context.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        CustomRatingBadgeWidget(rating: 4),
                        const SizedBox(width: 10),
                        CustomOutlineDropdownWidget(
                          selectedValue: '200 avaliações',
                          fontSize: 11,
                          iconColor: context.onSurface,
                          textColor: context.onSurface,
                          showUnderline: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.favorite, size: 26, color: context.surfaceContainerHighest),
            ],
          ),
          const SizedBox(height: 16),
          CustomCarouselWidget<SuiteModel>(
            items: motel.suites,
            height: 380,
            viewportFraction: 1,
            showDots: false,
            backgroundColor: context.onSurface,
            itemBuilder: (context, index, suite) {
              return Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: CustomLargeSuiteCardWidget(suite: suite));
            },
          ),
        ],
      ),
    );
  }
}
