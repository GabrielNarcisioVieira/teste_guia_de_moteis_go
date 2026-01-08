import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart'; // Importe aqui
import 'package:teste_tecnico_guia_de_moteis/core/models/motel_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/periodo_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/suite_model.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_small_motel_card_widget.dart';

void main() {
  testWidgets('Deve renderizar informações do motel e valor com desconto', (tester) async {
    await mockNetworkImagesFor(() async {
      final motel = MotelModel(
        fantasia: 'Motel Teste',
        bairro: 'Bairro Teste',
        logo: 'http://logo.com',
        distancia: 0,
        qtdFavoritos: 0,
        suites: [
          SuiteModel(
            nome: 'Suite 1',
            qtd: 1,
            exibirQtdDisponiveis: true,
            fotos: ['http://foto.com'],
            itens: [],
            categoriaItens: [],
            periodos: [
              PeriodoModel(
                tempoFormatado: '3h',
                tempo: '3',
                valor: 100.0,
                valorTotal: 80.0,
                temCortesia: false,
                desconto: 20.0,
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomSmallMotelCardWidget(motel: motel),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('motel teste'), findsOneWidget);
      expect(find.text('bairro teste'), findsOneWidget);
      expect(find.text('20% de desconto'), findsOneWidget);
      expect(find.textContaining('a partir de'), findsOneWidget);
      expect(find.text('reservar'), findsOneWidget);
    });
  });
}