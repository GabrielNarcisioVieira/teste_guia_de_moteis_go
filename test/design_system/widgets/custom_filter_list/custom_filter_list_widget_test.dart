import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/core/enum/filter_suite_enum.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_filter_list/custom_filter_list_widget.dart';

void main() {
  testWidgets('CustomFilterListWidget deve renderizar todos os enums do FilterSuiteEnum', (
    tester,
  ) async {
    final filters = FilterSuiteEnum.values;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomFilterListWidget(selectedFilters: const [], onFilterTapped: (_) {}),
        ),
      ),
    );

    expect(find.byType(ListView), findsOneWidget);

    expect(find.text(filters[0].label), findsOneWidget);
    expect(find.text(filters[1].label), findsOneWidget);
  });
}
