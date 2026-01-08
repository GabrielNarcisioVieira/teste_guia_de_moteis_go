import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_switch_button/custom_switch_option_widget.dart';

void main() {
  testWidgets('CustomSwitchOptionWidget deve renderizar label e icone corretamente', (
    tester,
  ) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Row(
            children: [
              CustomSwitchOptionWidget(
                label: 'Teste',
                icon: Icons.abc,
                index: 0,
                selectedIndex: 0,
                onTap: () => tapped = true,
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Teste'), findsOneWidget);
    expect(find.byIcon(Icons.abc), findsOneWidget);

    await tester.tap(find.byType(CustomSwitchOptionWidget));
    expect(tapped, isTrue);
  });

  testWidgets('CustomSwitchOptionWidget deve aplicar cores de selecionado corretamente', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
        home: Scaffold(
          body: Row(
            children: [
              CustomSwitchOptionWidget(
                label: 'Selecionado',
                icon: Icons.check,
                index: 1,
                selectedIndex: 1,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );

    final iconWidget = tester.widget<Icon>(find.byIcon(Icons.check));
    expect(iconWidget.color, isNotNull);
  });
}
