import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/suite_model.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_base_card_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_large_motel_card/custom_image_name_motel_card_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_large_motel_card/custom_item_icon_list_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_period_card_widget.dart';

class CustomSuiteInformationWidget extends StatelessWidget {
  final SuiteModel suite;

  const CustomSuiteInformationWidget({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 300,
          child: CustomImageNameMotelCardWidget(imageUrl: suite.fotos.first, suiteName: suite.nome),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: CustomBaseCardWidget(
            radius: 8,
            padding: const EdgeInsets.all(12),
            child: CustomItemIconListWidget(items: suite.categoriaItens),
          ),
        ),
        ...suite.periodos.map((periodo) {
          return CustomPeriodCardWidget(periodo: periodo, onTap: () {});
        }),
      ],
    );
  }
}
