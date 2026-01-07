class CategoriaItemModel {
  final String nome;
  final String icone;

  CategoriaItemModel({required this.nome, required this.icone});

  factory CategoriaItemModel.fromJson(Map<String, dynamic> json) =>
      CategoriaItemModel(nome: json['nome'] ?? '', icone: json['icone'] ?? '');

  CategoriaItemModel copyWith({String? nome, String? icone}) => CategoriaItemModel(nome: nome ?? this.nome, icone: icone ?? this.icone);
}
