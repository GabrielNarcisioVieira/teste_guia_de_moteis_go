import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/periodo_model.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_period_card_widget.dart';

void main() {
  testWidgets('Deve exibir preço cortado apenas quando houver desconto', (tester) async {
    final periodoComDesconto = PeriodoModel(
      tempoFormatado: '3 horas',
      tempo: '3',
      valor: 100.0,
      valorTotal: 80.0,
      temCortesia: false,
      desconto: 20.0,
    );

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: CustomPeriodCardWidget(periodo: periodoComDesconto))),
    );

    expect(find.textContaining('100'), findsOneWidget);
    expect(find.textContaining('80'), findsOneWidget);
    expect(find.text('20% off'), findsOneWidget);
  });
}
