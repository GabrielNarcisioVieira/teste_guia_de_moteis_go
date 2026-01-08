import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/view/home_view.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/view_model/home_view_model.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/widgets/home_body_skeleton_widget.dart';

class MockHomeViewModel extends Mock implements HomeViewModel {}

void main() {
  late MockHomeViewModel mockViewModel;

  setUp(() {
    mockViewModel = MockHomeViewModel();
    final getIt = GetIt.instance;
    if (getIt.isRegistered<HomeViewModel>()) {
      getIt.unregister<HomeViewModel>();
    }
    getIt.registerSingleton<HomeViewModel>(mockViewModel);

    when(() => mockViewModel.fetchMotels()).thenAnswer((_) async => {});
    when(() => mockViewModel.isLoading).thenReturn(false);
    when(() => mockViewModel.errorMessage).thenReturn(null);
    when(() => mockViewModel.filteredMotels).thenReturn([]);
    when(() => mockViewModel.motels).thenReturn([]);
  });

  testWidgets('Deve exibir Skeleton quando estiver carregando', (tester) async {
    when(() => mockViewModel.isLoading).thenReturn(true);

    await tester.pumpWidget(const MaterialApp(home: HomeView()));

    expect(find.byType(HomeBodySkeletonWidget), findsOneWidget);
  });
}
