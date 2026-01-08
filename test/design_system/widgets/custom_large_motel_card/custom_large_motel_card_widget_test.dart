import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/motel_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/suite_model.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_carousel_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_large_motel_card/custom_large_motel_card_widget.dart';

void main() {
  testWidgets('Deve renderizar as informações principais do motel e o carrossel', (tester) async {
    final motel = MotelModel(
      fantasia: 'MOTEL ELDORADO',
      bairro: 'JARDINS',
      logo: 'https://logo.com',
      distancia: 1.5,
      qtdFavoritos: 10,
      suites: [],
    );

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomLargeMotelCardWidget(motel: motel),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('motel eldorado'), findsOneWidget);
      expect(find.text('jardins'), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.byType(CustomCarouselWidget<SuiteModel>), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });
  });
}