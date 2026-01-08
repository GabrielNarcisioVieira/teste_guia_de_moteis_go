import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/enum/filter_suite_enum.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_filter_list/custom_filter_list_widget.dart';

class FilterHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<FilterSuiteEnum> selectedFilters;
  final Function(FilterSuiteEnum) onFilterTapped;
  final BuildContext parentContext;

  FilterHeaderDelegate({
    required this.selectedFilters,
    required this.onFilterTapped,
    required this.parentContext,
  });

  @override
  double get maxExtent => 65;

  @override
  double get minExtent => 65;

  @override
  bool shouldRebuild(covariant FilterHeaderDelegate oldDelegate) {
    return oldDelegate.selectedFilters != selectedFilters;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: parentContext.surfaceContainerHigh,
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: CustomFilterListWidget(
              selectedFilters: selectedFilters,
              onFilterTapped: onFilterTapped,
            ),
          ),
          Divider(color: parentContext.surfaceContainerHighest, thickness: 0.8, height: 1),
        ],
      ),
    );
  }
}
