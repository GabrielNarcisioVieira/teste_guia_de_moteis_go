import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/motel_price_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/motel_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/periodo_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/suite_model.dart';

void main() {
  group('MotelPriceExtension - getMenorValorEDesconto', () {
    test('Deve retornar 0.0 quando não houver suítes', () {
      final motel = MotelModel(
        fantasia: 'Motel Teste',
        suites: [],
        logo: '',
        bairro: '',
        distancia: 0,
        qtdFavoritos: 0,
      );

      final result = motel.getMenorValorEDesconto();

      expect(result.valor, 0.0);
      expect(result.desconto, 0.0);
    });

    test('Deve encontrar o menor valor entre múltiplas suítes e períodos', () {
      final suite1 = SuiteModel(
        nome: 'Suite 1',
        qtd: 1,
        exibirQtdDisponiveis: true,
        fotos: [],
        itens: [],
        categoriaItens: [],
        periodos: [
          PeriodoModel(
            tempoFormatado: '3h',
            valor: 100.0,
            valorTotal: 90.0,
            desconto: 10.0,
            temCortesia: false,
            tempo: '3',
          ),
          PeriodoModel(
            tempoFormatado: '6h',
            valor: 150.0,
            valorTotal: 150.0,
            desconto: null,
            temCortesia: false,
            tempo: '6',
          ),
        ],
      );

      final suite2 = SuiteModel(
        nome: 'Suite 2',
        qtd: 1,
        exibirQtdDisponiveis: true,
        fotos: [],
        itens: [],
        categoriaItens: [],
        periodos: [
          PeriodoModel(
            tempoFormatado: '3h',
            valor: 120.0,
            valorTotal: 120.0,
            desconto: null,
            temCortesia: false,
            tempo: '3',
          ),
          PeriodoModel(
            tempoFormatado: '12h',
            valor: 250.0,
            valorTotal: 200.0,
            desconto: 50.0,
            temCortesia: false,
            tempo: '12',
          ),
        ],
      );

      final motel = MotelModel(
        fantasia: 'Motel Teste',
        suites: [suite1, suite2],
        logo: '',
        bairro: '',
        distancia: 0,
        qtdFavoritos: 0,
      );

      final result = motel.getMenorValorEDesconto();

      expect(result.valor, 90.0);
      expect(result.desconto, 10.0);
    });
  });
}
