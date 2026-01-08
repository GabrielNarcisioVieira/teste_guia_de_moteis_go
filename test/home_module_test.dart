import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_tecnico_guia_de_moteis/core/services/http_service.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/home_module.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/repository/home_repository.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/view_model/home_view_model.dart';

class MockHttpService extends Mock implements HttpService {}

void main() {
  final getIt = GetIt.instance;

  setUp(() async {
    await getIt.reset();
  });

  test('registerHomeModule deve registrar repository e viewmodel usando HttpService', () {
    getIt.registerSingleton<HttpService>(MockHttpService());

    registerHomeModule(getIt);

    expect(getIt.isRegistered<HomeRepository>(), isTrue);
    expect(getIt.isRegistered<HomeViewModel>(), isTrue);
  });
}
