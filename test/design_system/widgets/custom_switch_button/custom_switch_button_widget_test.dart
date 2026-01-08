import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_switch_button/custom_switch_button_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_switch_button/custom_switch_option_widget.dart';

void main() {
  testWidgets('CustomSwitchButtonWidget deve alternar selecao ao clicar nas opcoes', (
    tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: CustomSwitchButtonWidget())));

    expect(find.text('ir agora'), findsOneWidget);
    expect(find.text('ir outro dia'), findsOneWidget);
    await tester.tap(find.text('ir outro dia'));
    await tester.pumpAndSettle();
    final animatedAlign = tester.widget<AnimatedAlign>(find.byType(AnimatedAlign));
    expect(animatedAlign.alignment, Alignment.centerRight);
  });

  testWidgets('CustomSwitchButtonWidget deve manter estrutura de Stack e Container', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: CustomSwitchButtonWidget())));

    final container = tester.widget<Container>(find.byType(Container).first);
    expect(container.constraints?.maxWidth, 280);
    expect(container.constraints?.maxHeight, 37);
    expect(find.byType(CustomSwitchOptionWidget), findsNWidgets(2));
  });
}
