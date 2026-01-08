import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_carousel_widget.dart';

void main() {
  testWidgets('Deve renderizar itens e permitir navegação por dots', (tester) async {
    final items = ['Item 1', 'Item 2', 'Item 3'];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomCarouselWidget<String>(
            items: items,
            height: 200,
            itemBuilder: (context, index, item) => Text(item),
          ),
        ),
      ),
    );

    expect(find.text('Item 1'), findsOneWidget);

    expect(find.byType(AnimatedContainer), findsNWidgets(3));
    await tester.drag(find.byType(PageView), const Offset(-400, 0));
    await tester.pumpAndSettle();

    expect(find.text('Item 2'), findsOneWidget);
  });
}
