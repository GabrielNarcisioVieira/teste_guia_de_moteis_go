import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/periodo_model.dart';

void main() {
  group('PeriodoModel', () {
    test('Deve converter de JSON com desconto no formato Map', () {
      final json = {
        'tempoFormatado': '3 horas',
        'valor': 100.0,
        'valorTotal': 70.0,
        'desconto': {'desconto': 30.0}
      };
      final model = PeriodoModel.fromJson(json);

      expect(model.desconto, 30.0);
      expect(model.valorTotal, 70.0);
    });

    test('Deve converter de JSON com desconto nulo', () {
      final json = {
        'tempoFormatado': '6 horas',
        'valor': 150.0,
        'valorTotal': 150.0,
        'desconto': null
      };
      final model = PeriodoModel.fromJson(json);

      expect(model.desconto, isNull);
    });

    test('Deve garantir que valores numéricos sejam convertidos para double com segurança', () {
      final json = {
        'valor': 100,
        'valorTotal': 85.5,
      };
      final model = PeriodoModel.fromJson(json);

      expect(model.valor, 100.0);
      expect(model.valorTotal, 85.5);
    });

    test('Deve realizar copyWith corretamente', () {
      final model = PeriodoModel(
        tempoFormatado: '12h',
        tempo: '12',
        valor: 200,
        valorTotal: 200,
        temCortesia: false,
      );
      final updated = model.copyWith(desconto: 50, valorTotal: 150);

      expect(updated.desconto, 50.0);
      expect(updated.valorTotal, 150.0);
      expect(updated.tempoFormatado, '12h');
    });
  });
}