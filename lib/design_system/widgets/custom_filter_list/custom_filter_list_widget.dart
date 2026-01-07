import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/enum/filter_suite_enum.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';

class CustomFilterListWidget extends StatelessWidget {
  final List<FilterSuiteEnum> selectedFilters;
  final Function(FilterSuiteEnum) onFilterTapped;

  const CustomFilterListWidget({
    super.key,
    required this.selectedFilters,
    required this.onFilterTapped,
  });

  @override
  Widget build(BuildContext context) {
    final allFilters = FilterSuiteEnum.values;

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: allFilters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = allFilters[index];
          final isSelected = selectedFilters.contains(filter);

          return _FilterChipItem(
            label: filter.label,
            isSelected: isSelected,
            onTap: () => onFilterTapped(filter),
          );
        },
      ),
    );
  }
}

class _FilterChipItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChipItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          // Se selecionado: Primary. Se não: Surface.
          color: isSelected ? context.primaryColor : context.surfaceColor,
          borderRadius: BorderRadius.circular(8), // Levemente arredondado
          border: Border.all(
            // Se selecionado: sem borda (ou borda primary). Se não: borda cinza claro.
            color: isSelected
                ? context.primaryColor
                : context.surfaceContainerHighest,
            width: 1.0,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: context.bodyMedium?.copyWith(
            // Se selecionado: Texto branco (onPrimary). Se não: Texto normal.
            color: isSelected ? context.onPrimary : context.onSurface,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}