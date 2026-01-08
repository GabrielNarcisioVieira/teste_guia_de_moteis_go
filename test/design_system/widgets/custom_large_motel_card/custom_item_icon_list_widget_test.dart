import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/categoria_item_model.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_large_motel_card/custom_item_icon_list_widget.dart';

void main() {
  group('CustomItemIconListWidget', () {
    testWidgets('Deve exibir no máximo 4 itens quando o total for 4', (tester) async {
      final items = List.generate(4, (i) => CategoriaItemModel(nome: 'Item $i', icone: ''));

      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CustomItemIconListWidget(items: items))),
      );

      expect(find.textContaining('ver'), findsNothing);
    });

    testWidgets('Deve exibir apenas 3 itens e o botão "ver todos" quando o total for 6', (
      tester,
    ) async {
      final items = List.generate(6, (i) => CategoriaItemModel(nome: 'Item $i', icone: ''));

      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: CustomItemIconListWidget(items: items))),
      );

      expect(find.textContaining('ver'), findsOneWidget);
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    });
  });
}
