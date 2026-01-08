import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_filter_list/custom_filter_chip_widget.dart';

void main() {
  testWidgets('CustomFilterChipItemWidget deve renderizar label e responder ao toque', (tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomFilterChipItemWidget(
            label: 'Piscina',
            isSelected: false,
            onTap: () => tapped = true,
            icon: Icons.pool,
          ),
        ),
      ),
    );

    expect(find.text('Piscina'), findsOneWidget);
    expect(find.byIcon(Icons.pool), findsOneWidget);

    await tester.tap(find.byType(CustomFilterChipItemWidget));
    expect(tapped, isTrue);
  });

  testWidgets('CustomFilterChipItemWidget deve mudar estilo quando selecionado', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(primaryColor: Colors.red),
        home: Scaffold(
          body: CustomFilterChipItemWidget(
            label: 'Hidro',
            isSelected: true,
            onTap: () {},
          ),
        ),
      ),
    );

    final container = tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
    final decoration = container.decoration as BoxDecoration;

    expect(decoration.color, isNotNull);
  });
}