import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/categoria_item_model.dart';

class CustomItemIconListWidget extends StatelessWidget {
  final List<CategoriaItemModel> items;

  const CustomItemIconListWidget({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final totalItems = items.length;
    final showSeeAll = totalItems > 4;

    final itemsToShow = showSeeAll
        ? items.take(3).toList()
        : items.take(4).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...itemsToShow.map((item) {
          return Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: context.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              item.icone,
              height: 42,
              width: 42,
              color: context.shadowColor,
              errorBuilder: (_, __, ___) => Icon(
                  Icons.help_outline,
                  size: 22,
                  color: context.onSurfaceVariant
              ),
            ),
          );
        }),

        if (showSeeAll)
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Row(
              children: [
                Text(
                  'ver\ntodos',
                  textAlign: TextAlign.right,
                  style: context.labelSmall?.copyWith(
                    color: context.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    height: 1.1,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, size: 16,),
              ],
            ),
          ),
      ],
    );
  }
}