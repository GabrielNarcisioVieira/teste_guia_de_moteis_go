import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:teste_tecnico_guia_de_moteis/core/utils/currency_utils.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('pt_BR', null);
  });

  group('CurrencyUtils - format', () {
    test('Deve formatar um valor double para o padrão BRL com símbolo', () {
      const valor = 1250.50;
      final resultado = CurrencyUtils.format(valor);

      expect(resultado, contains('R\$'));
      expect(resultado, contains('1.250,50'));
    });

    test('Deve retornar R\$ 0,00 quando o valor for nulo', () {
      final resultado = CurrencyUtils.format(null);
      expect(resultado, contains('0,00'));
    });

    test('Deve formatar corretamente valores com muitas casas decimais (arredondamento)', () {
      const valor = 88.999;
      final resultado = CurrencyUtils.format(valor);

      expect(resultado, contains('89,00'));
    });
  });

  group('CurrencyUtils - formatWithoutSymbol', () {
    test('Deve formatar valor sem o símbolo R\$', () {
      const valor = 45.90;
      final resultado = CurrencyUtils.formatWithoutSymbol(valor);

      expect(resultado, '45,90');
      expect(resultado, isNot(contains('R\$')));
    });

    test('Deve manter o separador de milhar mesmo sem o símbolo', () {
      const valor = 1500.00;
      final resultado = CurrencyUtils.formatWithoutSymbol(valor);
      expect(resultado, '1.500,00');
    });

    test('Deve retornar 0,00 para valores nulos sem símbolo', () {
      final resultado = CurrencyUtils.formatWithoutSymbol(null);
      expect(resultado, '0,00');
    });
  });
}
