class ItemModel {
  final String nome;

  ItemModel({required this.nome});

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(nome: json['nome'] ?? '');

  ItemModel copyWith({String? nome}) => ItemModel(nome: nome ?? this.nome);
}
