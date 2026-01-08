import 'package:teste_tecnico_guia_de_moteis/core/models/motel_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/suite_model.dart';

import '../enum/filter_suite_enum.dart';

extension MotelModelListExtension on List<MotelModel> {
  List<MotelModel> filterBySuiteFilters(List<FilterSuiteEnum> activeFilters) {
    final filters = activeFilters.where((f) => f != FilterSuiteEnum.filtros).toList();
    if (filters.isEmpty) return this;

    return map((motel) {
      final filteredSuites =
          motel.suites.where((suite) {
            return filters.every((filter) => _suiteSatisfiesFilter(suite, filter));
          }).toList();
      return motel.copyWith(suites: filteredSuites);
    }).where((motel) => motel.suites.isNotEmpty).toList();
  }

  bool _suiteSatisfiesFilter(SuiteModel suite, FilterSuiteEnum filter) {
    switch (filter) {
      case FilterSuiteEnum.comDesconto:
        return suite.periodos.any((p) => p.desconto != null);
      case FilterSuiteEnum.disponiveis:
        return suite.qtd > 0;
      case FilterSuiteEnum.internetWifi:
        return _checkItem(suite, 'wi-fi');
      case FilterSuiteEnum.hidro:
        return _checkItem(suite, 'hidro');
      case FilterSuiteEnum.piscina:
        return _checkItem(suite, 'piscina');
      case FilterSuiteEnum.sauna:
        return _checkItem(suite, 'sauna');
      case FilterSuiteEnum.ofuro:
        return _checkItem(suite, 'ofurô');
      case FilterSuiteEnum.decoracaoErotica:
        return _checkItem(suite, 'decoração erótica');
      case FilterSuiteEnum.decoracaoTematica:
        return _checkItem(suite, 'decoração temática');
      case FilterSuiteEnum.cadeiraErotica:
        return _checkItem(suite, 'cadeira erótica');
      case FilterSuiteEnum.pistaDeDanca:
        return _checkItem(suite, 'pista de dança');
      case FilterSuiteEnum.garagemPrivativa:
        return _checkItem(suite, 'garagem privativa') &&
            !suite.nome.toLowerCase().contains('s/ garagem');
      case FilterSuiteEnum.suiteParaFestas:
        return _checkItem(suite, 'festas');
      case FilterSuiteEnum.suiteComAcessibilidade:
        return _checkItem(suite, 'acessibilidade');
      default:
        return true;
    }
  }

  bool _checkItem(SuiteModel suite, String label) {
    final term = label.toLowerCase();
    return suite.categoriaItens.any((i) => i.nome.toLowerCase().contains(term)) ||
        suite.itens.any((i) => i.nome.toLowerCase().contains(term));
  }
}
