import 'package:teste_tecnico_guia_de_moteis/core/models/categoria_item_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/item_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/periodo_model.dart';

class SuiteModel {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<ItemModel> itens;
  final List<CategoriaItemModel> categoriaItens;
  final List<PeriodoModel> periodos;

  SuiteModel({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  factory SuiteModel.fromJson(Map<String, dynamic> json) => SuiteModel(
    nome: json['nome'] ?? '',
    qtd: json['qtd'] ?? 0,
    exibirQtdDisponiveis: json['exibirQtdDisponiveis'] ?? false,
    fotos: List<String>.from(json['fotos'] ?? []),
    itens: (json['itens'] as List?)?.map((i) => ItemModel.fromJson(i)).toList() ?? [],
    categoriaItens: (json['categoriaItens'] as List?)?.map((i) => CategoriaItemModel.fromJson(i)).toList() ?? [],
    periodos: (json['periodos'] as List?)?.map((i) => PeriodoModel.fromJson(i)).toList() ?? [],
  );

  SuiteModel copyWith({
    String? nome,
    int? qtd,
    bool? exibirQtdDisponiveis,
    List<String>? fotos,
    List<ItemModel>? itens,
    List<CategoriaItemModel>? categoriaItens,
    List<PeriodoModel>? periodos,
  }) => SuiteModel(
    nome: nome ?? this.nome,
    qtd: qtd ?? this.qtd,
    exibirQtdDisponiveis: exibirQtdDisponiveis ?? this.exibirQtdDisponiveis,
    fotos: fotos ?? this.fotos,
    itens: itens ?? this.itens,
    categoriaItens: categoriaItens ?? this.categoriaItens,
    periodos: periodos ?? this.periodos,
  );
}
