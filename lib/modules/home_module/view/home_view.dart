import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/app_theme_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_app_bar_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_empty_page_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/widgets/custom_floating_button_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/view_model/home_view_model.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/widgets/home_body_skeleton_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/widgets/home_body_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel = GetIt.I<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    _homeViewModel.fetchMotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      appBar: CustomAppBarWidget(),
      body: ListenableBuilder(
        listenable: _homeViewModel,
        builder: (_, child) {
          if (_homeViewModel.isLoading) {
            return const HomeBodySkeletonWidget();
          }

          if (_homeViewModel.errorMessage != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(_homeViewModel.errorMessage!, textAlign: TextAlign.center),
              ),
            );
          }

          if (_homeViewModel.filteredMotels.isEmpty) {
            return CustomEmptyPageWidget(
              onClearFilters: () => _homeViewModel.clearAllFilters(),
            );
          }

          return HomeBodyWidget(
            motels: _homeViewModel.motels,
            filteredMotels: _homeViewModel.filteredMotels,
            selectedFilters: _homeViewModel.selectedFilters,
            onToggleFilter: (filter) => _homeViewModel.toggleFilter(filter),
            onFetchMotels: () async {
              await _homeViewModel.fetchMotels();
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingButtonWidget(onTap: () {}),
    );
  }
}
