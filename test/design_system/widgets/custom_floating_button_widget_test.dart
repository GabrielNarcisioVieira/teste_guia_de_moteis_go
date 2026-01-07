import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_floating_button_widget.dart';

void main() {
  testWidgets('Deve disparar onTap ao clicar no botão de mapa', (tester) async {
    bool foiClicado = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: CustomFloatingButtonWidget(
            onTap: () => foiClicado = true,
          ),
        ),
      ),
    );

    expect(find.text('mapa'), findsOneWidget);
    expect(find.byIcon(Icons.map_outlined), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    expect(foiClicado, isTrue);
  });
}