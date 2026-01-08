import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/categoria_item_model.dart';

void main() {
  group('CategoriaItemModel', () {
    test('Deve converter de JSON corretamente', () {
      final json = {'nome': 'Frigobar', 'icone': 'url_imagem.png'};
      final model = CategoriaItemModel.fromJson(json);

      expect(model.nome, 'Frigobar');
      expect(model.icone, 'url_imagem.png');
    });

    test('Deve realizar o copyWith alterando apenas os campos solicitados', () {
      final model = CategoriaItemModel(nome: 'Sauna', icone: 'sauna.png');
      final updated = model.copyWith(nome: 'Sauna Seca');

      expect(updated.nome, 'Sauna Seca');
      expect(updated.icone, 'sauna.png');
    });
  });
}