import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_button_widget.dart';

void main() {
  testWidgets('Deve exibir CircularProgressIndicator quando isLoading for true', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButtonWidget(label: 'Confirmar', isLoading: true, onPressed: () {}),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Confirmar'), findsNothing);
  });

  testWidgets('Deve exibir label e icone quando não estiver carregando', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButtonWidget(label: 'Reservar', icon: Icons.add, onPressed: () {}),
        ),
      ),
    );

    expect(find.text('Reservar'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
