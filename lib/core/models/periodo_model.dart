class PeriodoModel {
  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final double? desconto;

  PeriodoModel({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    this.desconto,
  });

  factory PeriodoModel.fromJson(Map<String, dynamic> json) => PeriodoModel(
    tempoFormatado: json['tempoFormatado'] ?? '',
    tempo: json['tempo'] ?? '',
    valor: (json['valor'] as num?)?.toDouble() ?? 0.0,
    valorTotal: (json['valorTotal'] as num?)?.toDouble() ?? 0.0,
    temCortesia: json['temCortesia'] ?? false,
    desconto:
        json['desconto'] != null
            ? (json['desconto'] is Map ? (json['desconto']['desconto'] as num?)?.toDouble() ?? 0.0 : (json['desconto'] as num).toDouble())
            : null,
  );

  PeriodoModel copyWith({String? tempoFormatado, String? tempo, double? valor, double? valorTotal, bool? temCortesia, double? desconto}) =>
      PeriodoModel(
        tempoFormatado: tempoFormatado ?? this.tempoFormatado,
        tempo: tempo ?? this.tempo,
        valor: valor ?? this.valor,
        valorTotal: valorTotal ?? this.valorTotal,
        temCortesia: temCortesia ?? this.temCortesia,
        desconto: desconto ?? this.desconto,
      );
}
