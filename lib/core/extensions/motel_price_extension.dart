import 'package:teste_tecnico_guia_de_moteis/core/models/motel_model.dart';

extension MotelPriceExtension on MotelModel {
  ({double valor, double desconto}) getMenorValorEDesconto() {
    if (suites.isEmpty) {
      return (valor: 0.0, desconto: 0.0);
    }

    final todosPeriodos = suites.expand((suite) => suite.periodos).toList();

    if (todosPeriodos.isEmpty) {
      return (valor: 0.0, desconto: 0.0);
    }

    final menorPeriodo = todosPeriodos.reduce((atual, proximo) {
      return atual.valorTotal < proximo.valorTotal ? atual : proximo;
    });

    return (
    valor: menorPeriodo.valorTotal,
    desconto: menorPeriodo.desconto ?? 0.0
    );
  }
}