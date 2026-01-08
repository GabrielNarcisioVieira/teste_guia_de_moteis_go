import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_large_motel_card/custom_image_name_motel_card_widget.dart';

void main() {
  testWidgets('Deve exibir o nome da suíte em letras minúsculas e carregar imagem', (tester) async {
    const suiteName = 'SUÍTE MASTER';
    const imageUrl = 'https://link.com/foto.jpg';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomImageNameMotelCardWidget(imageUrl: imageUrl, suiteName: suiteName),
        ),
      ),
    );

    expect(find.text('suíte master'), findsOneWidget);
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.byType(ShaderMask), findsOneWidget);
  });
}
