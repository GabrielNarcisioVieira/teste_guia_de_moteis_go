import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tecnico_guia_de_moteis/core/enum/filter_suite_enum.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/motel_model_list_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/categoria_item_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/item_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/motel_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/suite_model.dart';

void main() {
  group('MotelModelListExtension - filterBySuiteFilters', () {
    final suiteComPiscina = SuiteModel(
      nome: 'Luxo',
      qtd: 1,
      fotos: [],
      periodos: [],
      itens: [],
      categoriaItens: [CategoriaItemModel(nome: 'Piscina', icone: '')],
      exibirQtdDisponiveis: false,
    );

    final suiteComHidro = SuiteModel(
      nome: 'Master',
      qtd: 1,
      fotos: [],
      periodos: [],
      itens: [],
      categoriaItens: [CategoriaItemModel(nome: 'Hidro', icone: '')],
      exibirQtdDisponiveis: false,
    );

    final listaMoteis = [
      MotelModel(
        fantasia: 'Motel A',
        suites: [suiteComPiscina],
        logo: '',
        bairro: '',
        distancia: 0,
        qtdFavoritos: 0,
      ),
      MotelModel(
        fantasia: 'Motel B',
        suites: [suiteComHidro],
        logo: '',
        bairro: '',
        distancia: 0,
        qtdFavoritos: 0,
      ),
      MotelModel(
        fantasia: 'Motel C',
        suites: [suiteComPiscina, suiteComHidro],
        logo: '',
        bairro: '',
        distancia: 0,
        qtdFavoritos: 0,
      ),
    ];

    test('Deve retornar a lista original se não houver filtros ativos', () {
      final result = listaMoteis.filterBySuiteFilters([]);
      expect(result.length, 3);
    });

    test('Deve ignorar o filtro do tipo "filtros" (estático)', () {
      final result = listaMoteis.filterBySuiteFilters([FilterSuiteEnum.filtros]);
      expect(result.length, 3);
    });

    test('Deve filtrar motéis e suítes que possuem Piscina', () {
      final result = listaMoteis.filterBySuiteFilters([FilterSuiteEnum.piscina]);

      expect(result.length, 2);
      expect(result.any((m) => m.fantasia == 'Motel B'), isFalse);
      final motelC = result.firstWhere((m) => m.fantasia == 'Motel C');
      expect(motelC.suites.length, 1);
      expect(motelC.suites.first.nome, 'Luxo');
    });

    test('Deve retornar vazio se nenhum motel atender ao critério combinado (AND)', () {
      final result = listaMoteis.filterBySuiteFilters([
        FilterSuiteEnum.piscina,
        FilterSuiteEnum.hidro,
      ]);

      expect(result.isEmpty, isTrue);
    });

    test('Deve validar corretamente garagem privativa excluindo "s/ garagem"', () {
      final suiteSemGaragemNoNome = SuiteModel(
        nome: 'Suite s/ garagem',
        qtd: 1,
        fotos: [],
        periodos: [],
        categoriaItens: [],
        itens: [ItemModel(nome: 'garagem privativa')],
        exibirQtdDisponiveis: false,
      );

      final motelX = MotelModel(
        fantasia: 'X',
        suites: [suiteSemGaragemNoNome],
        logo: '',
        bairro: '',
        distancia: 0,
        qtdFavoritos: 0,
      );

      final result = [motelX].filterBySuiteFilters([FilterSuiteEnum.garagemPrivativa]);

      expect(result.isEmpty, isTrue);
    });
  });
}
