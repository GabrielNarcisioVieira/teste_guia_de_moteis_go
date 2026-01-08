import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/periodo_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/suite_model.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_large_motel_card/custom_suite_information_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_period_card_widget.dart';

void main() {
  testWidgets('Deve renderizar imagem da suíte e a lista de períodos', (tester) async {
    final suite = SuiteModel(
      nome: 'Suite Master',
      qtd: 1,
      exibirQtdDisponiveis: true,
      fotos: ['https://foto.com'],
      itens: [],
      categoriaItens: [],
      periodos: [
        PeriodoModel(
          tempoFormatado: '3h',
          tempo: '3',
          valor: 100,
          valorTotal: 100,
          temCortesia: false,
        ),
        PeriodoModel(
          tempoFormatado: '6h',
          tempo: '6',
          valor: 180,
          valorTotal: 180,
          temCortesia: false,
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: CustomSuiteInformationWidget(suite: suite)),
        ),
      ),
    );

    expect(find.byType(CustomPeriodCardWidget), findsNWidgets(2));
    expect(find.text('suite master'), findsOneWidget);
  });
}
