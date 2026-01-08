import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_tecnico_guia_de_moteis/app_widget.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/view_model/home_view_model.dart';

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
    when(() => mockViewModel.selectedFilters).thenReturn([]);
  });

  testWidgets('AppWidget deve configurar MaterialApp e carregar HomeView', (tester) async {
    await tester.pumpWidget(const AppWidget());
    expect(find.byType(MaterialApp), findsOneWidget);
    final MaterialApp app = tester.widget(find.byType(MaterialApp));
    expect(app.debugShowCheckedModeBanner, isFalse);
    expect(app.theme, isNotNull);
  });
}
