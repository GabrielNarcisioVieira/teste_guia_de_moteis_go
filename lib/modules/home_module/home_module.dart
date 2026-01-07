import 'package:get_it/get_it.dart';
import 'package:teste_tecnico_guia_de_moteis/core/services/http_service.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/repository/home_repository.dart';

void registerHomeModule(GetIt getIt){
  getIt.registerLazySingleton<HomeRepository>(
        () => HomeRepository(getIt<HttpService>()),
  );
}