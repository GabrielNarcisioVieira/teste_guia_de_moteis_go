import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/enum/filter_suite_enum.dart';
import 'package:teste_tecnico_guia_de_moteis/core/utils/filter_suite_utils.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_filter_list/custom_filter_chip_widget.dart';

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
    var allFilters = FilterSuiteEnum.values;

    return SizedBox(
      height: 34,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: allFilters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = allFilters[index];
          final isSelected = selectedFilters.contains(filter);

          return CustomFilterChipItemWidget(
            icon: FilterSuiteUtils.isFiltersChip(filter) ? Icons.filter_alt_outlined : null,
            label: filter.label,
            isSelected: isSelected,
            onTap: () => onFilterTapped(filter),
          );
        },
      ),
    );
  }
}
