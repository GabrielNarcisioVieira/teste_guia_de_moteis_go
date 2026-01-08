import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/item_model.dart';

void main() {
  group('ItemModel', () {
    test('Deve converter de JSON corretamente', () {
      final json = {'nome': 'ar-condicionado'};
      final model = ItemModel.fromJson(json);

      expect(model.nome, 'ar-condicionado');
    });

    test('Deve retornar string vazia se o nome for nulo no JSON', () {
      final model = ItemModel.fromJson({});
      expect(model.nome, '');
    });

    test('Deve realizar o copyWith corretamente', () {
      final model = ItemModel(nome: 'TV');
      final updated = model.copyWith(nome: 'Smart TV');

      expect(updated.nome, 'Smart TV');
      expect(model.nome, 'TV');
    });
  });
}