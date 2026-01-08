import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/enum/filter_suite_enum.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/motel_model.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_carousel_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_filter_list/custom_filter_header_delegate_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_large_motel_card/custom_large_motel_card_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_outline_dropdown_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_small_motel_card_widget.dart';

class HomeBodyWidget extends StatelessWidget {
  final List<MotelModel> motels;
  final List<MotelModel> filteredMotels;
  final List<FilterSuiteEnum> selectedFilters;
  final void Function(FilterSuiteEnum) onToggleFilter;
  final Future<void> Function() onFetchMotels;

  const HomeBodyWidget({
    super.key,
    required this.motels,
    required this.filteredMotels,
    required this.selectedFilters,
    required this.onToggleFilter, required this.onFetchMotels,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: CustomOutlineDropdownWidget(selectedValue: 'grande sp'),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: context.surfaceContainerHigh,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            ),
            clipBehavior: Clip.antiAlias,
            padding: EdgeInsets.zero,
            child: RefreshIndicator(
              color: context.primaryColor,
              backgroundColor: context.surfaceColor,
              onRefresh: () async {
                await onFetchMotels();
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(height: 12, color: context.surfaceContainerLowest),
                  ),
                  SliverToBoxAdapter(
                    child: CustomCarouselWidget<MotelModel>(
                      items: motels.length > 7 ? motels.sublist(0, 7) : motels,
                      height: 180,
                      viewportFraction: 1,
                      showDots: true,
                      itemBuilder: (context, index, motel) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: CustomSmallMotelCardWidget(motel: motel),
                        );
                      },
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    floating: false,
                    delegate: FilterHeaderDelegate(
                      selectedFilters: selectedFilters,
                      onFilterTapped: (filter) => onToggleFilter(filter),
                      parentContext: context,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(childCount: motels.length, (context, index) {
                      return Padding(
                        padding:
                            index == filteredMotels.length - 1
                                ? EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 100)
                                : EdgeInsets.all(16.0),
                        child: CustomLargeMotelCardWidget(motel: motels[index]),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
