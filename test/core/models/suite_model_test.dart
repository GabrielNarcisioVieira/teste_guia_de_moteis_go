import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/suite_model.dart';

void main() {
  group('SuiteModel', () {
    final complexJson = {
      'nome': 'Suíte Luxo',
      'qtd': 5,
      'fotos': ['img1.jpg', 'img2.jpg'],
      'itens': [{'nome': 'Hidro'}],
      'categoriaItens': [{'nome': 'Piscina', 'icone': 'icon.png'}],
      'periodos': [{'tempoFormatado': '3h', 'valor': 100.0, 'valorTotal': 100.0}]
    };

    test('Deve converter JSON complexo e aninhado com sucesso', () {
      final model = SuiteModel.fromJson(complexJson);

      expect(model.nome, 'Suíte Luxo');
      expect(model.fotos.length, 2);
      expect(model.itens.first.nome, 'Hidro');
      expect(model.categoriaItens.first.nome, 'Piscina');
      expect(model.periodos.first.tempoFormatado, '3h');
    });

    test('Deve inicializar listas vazias se os campos no JSON forem nulos', () {
      final model = SuiteModel.fromJson({'nome': 'Suite Simples'});

      expect(model.fotos, isEmpty);
      expect(model.itens, isEmpty);
      expect(model.categoriaItens, isEmpty);
      expect(model.periodos, isEmpty);
    });

    test('Deve realizar copyWith de listas corretamente', () {
      final model = SuiteModel(
        nome: 'Original',
        qtd: 1,
        exibirQtdDisponiveis: true,
        fotos: [],
        itens: [],
        categoriaItens: [],
        periodos: [],
      );

      final updated = model.copyWith(nome: 'Novo Nome', qtd: 10);

      expect(updated.nome, 'Novo Nome');
      expect(updated.qtd, 10);
      expect(updated.exibirQtdDisponiveis, isTrue);
    });
  });
}