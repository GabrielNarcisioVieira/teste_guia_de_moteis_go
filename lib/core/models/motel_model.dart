import 'package:teste_tecnico_guia_de_moteis/core/models/suite_model.dart';

class MotelModel {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final List<SuiteModel> suites;

  MotelModel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.suites,
  });

  factory MotelModel.fromJson(Map<String, dynamic> json) => MotelModel(
    fantasia: json['fantasia'] ?? '',
    logo: json['logo'] ?? '',
    bairro: json['bairro'] ?? '',
    distancia: (json['distancia'] as num?)?.toDouble() ?? 0.0,
    qtdFavoritos: json['qtdFavoritos'] ?? 0,
    suites: (json['suites'] as List?)?.map((s) => SuiteModel.fromJson(s)).toList() ?? [],
  );

  MotelModel copyWith({String? fantasia, String? logo, String? bairro, double? distancia, int? qtdFavoritos, List<SuiteModel>? suites}) =>
      MotelModel(
        fantasia: fantasia ?? this.fantasia,
        logo: logo ?? this.logo,
        bairro: bairro ?? this.bairro,
        distancia: distancia ?? this.distancia,
        qtdFavoritos: qtdFavoritos ?? this.qtdFavoritos,
        suites: suites ?? this.suites,
      );
}
