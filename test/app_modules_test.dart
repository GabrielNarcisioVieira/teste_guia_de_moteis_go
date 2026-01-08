import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_tecnico_guia_de_moteis/app_modules.dart';
import 'package:teste_tecnico_guia_de_moteis/core/services/http_service.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/repository/home_repository.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/view_model/home_view_model.dart';

void main() {
  final getIt = GetIt.instance;

  setUp(() async {
    await getIt.reset();
  });

  test('setDependencies deve registrar todas as dependências globais e de módulos', () async {
    await setDependencies();

    expect(getIt.isRegistered<HttpService>(), isTrue);
    expect(getIt.isRegistered<HomeRepository>(), isTrue);
    expect(getIt.isRegistered<HomeViewModel>(), isTrue);
  });
}
