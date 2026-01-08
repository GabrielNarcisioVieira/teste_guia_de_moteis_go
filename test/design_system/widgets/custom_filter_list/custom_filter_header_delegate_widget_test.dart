import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_filter_list/custom_filter_header_delegate_widget.dart';

void main() {
  testWidgets('FilterHeaderDelegate deve respeitar a altura definida', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: [
              Builder(
                builder: (context) {
                  return SliverPersistentHeader(
                    pinned: true,
                    delegate: FilterHeaderDelegate(
                      selectedFilters: const [],
                      onFilterTapped: (_) {},
                      parentContext: context,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

    final containerFinder = find.byType(Container).first;
    final Size size = tester.getSize(containerFinder);

    expect(size.height, equals(65.0));
  });
}
