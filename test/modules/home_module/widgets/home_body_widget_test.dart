import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/widgets/home_body_widget.dart';

void main() {
  testWidgets('HomeBodyWidget deve renderizar Dropdown inicial', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeBodyWidget(
            motels: const [],
            filteredMotels: const [],
            selectedFilters: const [],
            onToggleFilter: (_) {},
            onFetchMotels: () async {},
          ),
        ),
      ),
    );

    expect(find.text('grande sp'), findsOneWidget);
  });
}
