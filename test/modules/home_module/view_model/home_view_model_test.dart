import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_tecnico_guia_de_moteis/core/architecture/result_architecture.dart';
import 'package:teste_tecnico_guia_de_moteis/core/enum/filter_suite_enum.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/repository/home_repository.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/view_model/home_view_model.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late HomeViewModel viewModel;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    viewModel = HomeViewModel(mockRepository);
  });

  test('Estado inicial deve estar correto', () {
    expect(viewModel.isLoading, isFalse);
    expect(viewModel.motels, isEmpty);
    expect(viewModel.selectedFilters, isEmpty);
  });

  test('Deve carregar motéis com sucesso e atualizar listas', () async {
    when(() => mockRepository.getMotels()).thenAnswer((_) async => Success([]));

    await viewModel.fetchMotels();

    expect(viewModel.isLoading, isFalse);
    expect(viewModel.errorMessage, isNull);
    verify(() => mockRepository.getMotels()).called(1);
  });

  test('Deve adicionar e remover filtros corretamente', () {
    viewModel.toggleFilter(FilterSuiteEnum.piscina);
    expect(viewModel.selectedFilters.contains(FilterSuiteEnum.piscina), isTrue);

    viewModel.toggleFilter(FilterSuiteEnum.piscina);
    expect(viewModel.selectedFilters, isEmpty);
  });
}
