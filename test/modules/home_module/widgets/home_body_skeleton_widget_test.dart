import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/widgets/home_body_skeleton_widget.dart';

void main() {
  testWidgets('HomeBodySkeletonWidget deve conter Shimmer animado', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: HomeBodySkeletonWidget())));
    expect(find.byType(Shimmer), findsOneWidget);
  });
}
