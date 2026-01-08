import 'package:intl/intl.dart';

class CurrencyUtils {
  CurrencyUtils._();

  static final NumberFormat _brlFormatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$', decimalDigits: 2);

  static String format(double? value) {
    return _brlFormatter.format(value ?? 0.0);
  }

  static String formatWithoutSymbol(double? value) {
    final formatted = _brlFormatter.format(value ?? 0.0);
    return formatted.replaceAll('R\$', '').trim();
  }
}
